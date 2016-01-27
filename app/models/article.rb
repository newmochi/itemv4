class Article < ActiveRecord::Base

  validates :asciino, :category1, :category2, presence: true
  validates :type_p1v2a9, presence: true,
    numericality: { only_integer: true,
       greater_than: 0, less_than: 3 }
  validates :os_w1x2, presence: true,
    numericality: { only_integer: true,
       greater_than: 0, less_than: 3, allow_blank: true }
  validates :daisu, presence: true,
    numericality: { only_integer: true,
       greater_equal: 0, less_than: 50, allow_blank: true }
  validates :core, presence: true,
    numericality: { only_integer: true,
       greater_equal: 0, less_than: 17, allow_blank: true }
  validates :memgbyte, presence: true,
    numericality: { only_integer: true,
       greater_equal: 0, less_than: 257, allow_blank: true }
  validates :storagegbyte, presence: true,
    numericality: { only_integer: true,
       greater_equal: 0, allow_blank: true }

  class << self
    def sidebar_articles(num = 5)
      order("rev_date DESC").limit(num)
#NG      where(ownername: @current_member).order("rev_date DESC").limit(num)
    end
# add on search 場所とオーナー
# 以下は断念 rel = rel.where("ownername LIKE ?","%#{query2}%")
    def search(query1,query2)
      flg = 0
      if query1.present?
        rel = where(location: query1 )
        flg = 1
      end
      if query2.present?
        if flg == 1
          rel = rel.where(ownername: query2)
        else
          rel = where(ownername: query2)
          flg = 1
        end
      end
      if ( flg == 1)
        rel = rel.order("asciino, category1, category2")
      else
        rel = order("asciino, category1, category2")
      end

    end
  end

end

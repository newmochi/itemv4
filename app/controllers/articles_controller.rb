# coding: utf-8

class ArticlesController < ApplicationController
  # 記事一覧
  require 'csv'
  before_filter :login_required

  # 記事一覧
  def index
    @articles = Article.order("asciino, category1, category2").
                  paginate(page: params[:page], per_page: 20)
  end

  # 検索 by 場所、オーナー、分類１
  def search
    @articles = Article.search(params[:q1], params[:q2]).paginate(page: params[:page], per_page: 20)
    render "index"
  end

  # 記事詳細
  def show
    @article = Article.find(params[:id])
  end

  # 新規登録フォーム
  def new
    @article = Article.new
  end

  # 編集フォーム
  def edit
    @article = Article.find(params[:id])
  end


  # 新規作成
  def create
#    @article = Article.new(params[:article])
    @article = Article.new(params[:article].
    permit(:asciino, :category1, :category2,
    :servername, :type_p1v2a9, :os_w1x2, :osfullname,
    :daisu, :core, :memgbyte, :storagegbyte, :remark,
    :st1_fs, :st2_rep, :st3_mbps, :bu1_type,
    :bu2_interval, :bu3_fullsize, :bu4_diffsize,
    :ownername, :rev_date,:location, :iops, :balancer_use1no0)
    )
    if @article.save
      redirect_to @article, notice: "サーバリソース情報を登録しました。"
    else
      render "new"
    end
  end

  # 更新
  def update
    @article = Article.find(params[:id])
#    @article.assign_attributes(params[:article])
    @article.assign_attributes(params[:article].
    permit(:asciino, :category1, :category2,
    :servername, :type_p1v2a9, :os_w1x2, :osfullname,
    :daisu, :core, :memgbyte, :storagegbyte, :remark,
    :st1_fs, :st2_rep, :st3_mbps, :bu1_type,
    :bu2_interval, :bu3_fullsize, :bu4_diffsize,
    :ownername, :rev_date,:location, :iops, :balancer_use1no0)
    )

    if @article.save
      redirect_to @article, notice: "サーバリソース情報を更新しました。"
    else
      render "edit"
    end
  end

  # 削除
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to :articles, notice: "サーバリソース情報を削除しました。"
  end
  def download
    @articles = Article.order(":asciino, category1, category2")

    header = ['番号', '設置場所',  'オーナー', '分類', '利用者機能', 'サーバー名称',
'形態物理1仮想2','LB(1)aplscale(2)', 'OSWindows1linux2', 'OS商品名とバージョン',
'台数', 'コア数', 'メモリ（ＧＢ）', 'ストレージ論理（ＧＢ）',
'IOPS(数値or文章)',
'データ用fileSystem', 'スナップやレプリケーション', 'ストレージ性能Mbps(10～1000)',
'バックアップタイプ(1=蓄積,2=フル＆差分)','バックアップ周期(1=毎週,2=隔週,4=毎月)',
'ルバックアップ容量(MB)', '差分または毎回容量(MB)',
 '自由記述','更新日時' ]
    generated_csv = CSV.generate(row_sep: "\r\n") do |csv|
      csv << header
      @articles.each do |i|
        csv << [i.asciino, i.location, i.ownername, i.category1,
i.category2, i.servername, i.type_p1v2a9, i.balancer_use1no0, i.os_w1x2,
i.osfullname, i.daisu, i.core, i.memgbyte, i.storagegbyte,
i.iops,
i.st1_fs, i.st2_rep, i.st3_mbps, i.bu1_type,
i.bu2_interval, i.bu3_fullsize, i.bu4_diffsize,
i.remark, i.rev_date ]
      end
    end

    send_data generated_csv.encode(Encoding::CP932, invalid: :replace, undef: :replace),
      filename: 'serverlist.csv',
      type: 'text/csv; charset=shift_jis'
  end


end


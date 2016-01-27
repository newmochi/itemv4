class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|

# サーバーリソース見積表
      t.string :asciino                # ユーザ指定の番号（文字列）
      t.string :category1              # 分類
      t.string :category2              # 利用者機能
      t.string :servername             # サーバー名称、機能詳細
      t.integer :type_p1v2a9       # 形態物理1仮想2アプライアンス9
      t.integer :os_w1x2           # OSWindows1linux2
      t.string :osfullname         # OS商品名とバージョン
      t.integer :daisu                 # 台数
      t.integer :core                  # コア数
      t.integer :memgbyte              # メモリ（ＧＢ）
      t.integer :storagegbyte          # ストレージ論理（ＧＢ）
      t.string :remark                 # 自由記述
      t.string :ownername              # オーナー（手動不可）
      t.datetime :rev_date             # 更新日時（手動不可）

      t.timestamps
    end
  end
end

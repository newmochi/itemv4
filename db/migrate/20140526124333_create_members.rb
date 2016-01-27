class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :number, null: false     # 従業員番号等重複不可
      t.string :name, null: false        # ニックネーム兼ユーザ名
      t.string :full_name                # 本名（漢字）
      t.string :email                    # メールアドレス
      t.string :remark                   # 備考、業務用説明
      t.boolean :administrator, null: false, default: false
                                         # 管理者フラグ
      t.timestamps
    end
  end
end

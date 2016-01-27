class ModifyArticles1 < ActiveRecord::Migration
  def up
  end
  def change
    add_column :articles, :location, :string
    add_column :articles, :iops, :string
  end
  def down
  end
end

class ModifyArticles3 < ActiveRecord::Migration
  def change
    add_column :articles, :st1_fs, :integer
    add_column :articles, :st2_rep, :integer
    add_column :articles, :st3_mbps, :integer
    add_column :articles, :bu1_type, :integer
    add_column :articles, :bu2_interval, :integer
    add_column :articles, :bu3_fullsize, :integer
    add_column :articles, :bu4_diffsize, :integer
  end
end

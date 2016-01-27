class ModifyMembers1 < ActiveRecord::Migration
  def up
  end
  def change
    add_column :members, :hashed_password, :string
  end
  def down
  end
end

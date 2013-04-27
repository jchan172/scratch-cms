class RemoveFieldNameFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :pword
  end

  def down
    add_column :users, :pword, :string
  end
end

class AddDetailsToUser < ActiveRecord::Migration
  def change
    add_column :users, :pword, :string
    add_column :users, :string, :string
  end
end

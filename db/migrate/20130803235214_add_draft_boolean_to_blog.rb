class AddDraftBooleanToBlog < ActiveRecord::Migration
  def change
  	add_column :blogs, :draft, :boolean, :default => false
  end
end

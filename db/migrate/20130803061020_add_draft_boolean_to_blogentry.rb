class AddDraftBooleanToBlogentry < ActiveRecord::Migration
  def change
  	add_column :blogentries, :draft, :boolean, :default => false
  end
end

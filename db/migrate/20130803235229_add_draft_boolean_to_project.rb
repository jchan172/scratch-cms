class AddDraftBooleanToProject < ActiveRecord::Migration
  def change
  	add_column :projects, :draft, :boolean, :default => false
  end
end

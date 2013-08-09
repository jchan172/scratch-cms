class AddDraftBooleanToCustom < ActiveRecord::Migration
  def change
  	add_column :custompages, :draft, :boolean, :default => false
  end
end

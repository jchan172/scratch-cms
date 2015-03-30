class AddSlugToCustompage < ActiveRecord::Migration
  def change
    add_column :custompages, :slug, :string, unique: true
  end
end

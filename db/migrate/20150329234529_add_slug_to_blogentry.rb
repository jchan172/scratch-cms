class AddSlugToBlogentry < ActiveRecord::Migration
  def change
    add_column :blogentries, :slug, :string, unique: true
  end
end

class AddSlugToBlog < ActiveRecord::Migration
  def changew
    add_column :blogs, :slug, :string, unique: true
  end
end

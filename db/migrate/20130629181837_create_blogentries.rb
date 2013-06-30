class CreateBlogentries < ActiveRecord::Migration
  def change
    create_table :blogentries do |t|
      t.string :title
      t.text :content
      t.integer :blog_id

      t.timestamps
    end
  end
end

class ChangeProjectContentStrToText < ActiveRecord::Migration
  def self.up
    change_table :projects do |t|
      t.change :content, :text
    end
  end
 
  def self.down
    change_table :projects do |t|
      t.change :content, :string
    end
  end
end

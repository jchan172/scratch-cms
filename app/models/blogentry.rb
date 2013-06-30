class Blogentry < ActiveRecord::Base
  attr_accessible :content, :title, :blog_id

  belongs_to :blog

  validates :blog_id, presence: true
  validates :content, presence: true, length: {maximum: 500}
  validates :title, presence: true

  default_scope order: 'blogentries.created_at DESC'
end

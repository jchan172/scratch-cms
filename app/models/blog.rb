class Blog < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user
  validates :content, presence: true, length: {maximum: 500}
  validates :title, presence: true
  validates :user_id, presence: true

  default_scope order: 'projects.created_at DESC'
end

class Blog < ActiveRecord::Base
  attr_accessible :content, :title
  
  belongs_to :user
  has_many :blogentries, dependent: :destroy

  validates :content, presence: true, length: {maximum: 500}
  validates :title, presence: true
  validates :user_id, presence: true

  default_scope order: 'blogs.created_at DESC'
end

# == Schema Information
#
# Table name: blogs
#
#  id         :integer          not null, primary key
#  content    :string(255)
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Blog < ActiveRecord::Base
  belongs_to :user
  has_many :blogentries, dependent: :destroy

  validates :content, presence: true, length: {maximum: 500}
  validates :title, presence: true
  validates :user_id, presence: true

  default_scope order: 'blogs.created_at DESC'
end

# == Schema Information
#
# Table name: blogentries
#
#  id         :integer          not null, primary key
#  title      :string(255)
#  content    :text
#  blog_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Blogentry < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :blog

  validates :blog_id, presence: true
  validates :content, presence: true
  validates :title, presence: true

  default_scope order: 'blogentries.created_at DESC'
end

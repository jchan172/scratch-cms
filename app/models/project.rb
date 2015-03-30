# == Schema Information
#
# Table name: projects
#
#  id         :integer          not null, primary key
#  content    :text
#  title      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  
  validates :content, presence: true
  validates :title, presence: true
  validates :user_id, presence: true

  default_scope order: 'projects.created_at DESC'
end

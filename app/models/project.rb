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
  attr_accessible :content, :title

  belongs_to :user
  
  validates :content, presence: true, length: {maximum: 500}
  validates :title, presence: true
  validates :user_id, presence: true

  default_scope order: 'projects.created_at DESC'
end

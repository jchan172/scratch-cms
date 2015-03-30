# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  string          :string(255)
#  password_digest :string(255)
#  auth_token      :string(255)
#  username        :string(255)
#

require 'securerandom'

class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, use: :slugged

  has_many :projects, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :custompages, dependent: :destroy
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save { |user| user.username = username.downcase }
  before_create :create_auth_token

  validates :name, presence: true, length: { maximum: 50 }
  validates :username, 
            presence: true, 
            length: { maximum: 50 }, 
            uniqueness: { case_sensitive: true}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
  			presence: true,
  			uniqueness: { case_sensitive: true },
  			format: { with: VALID_EMAIL_REGEX } 
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  # validate do |user|
  #   user.errors.add(:base, "Only one user may exist.") if User.first
  # end

  private
  	# keep this method private because we don't want
  	# other things to mess with authentication token
  	def create_auth_token
  		self.auth_token = SecureRandom.base64(13)
  	end
end

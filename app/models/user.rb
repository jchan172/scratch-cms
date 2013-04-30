class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save { |user| user.email = email.downcase }
  before_save :create_auth_token

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
  			presence: true,
  			uniqueness: { case_sensitive: true },
  			format: { with: VALID_EMAIL_REGEX } 
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  private
	# keep this method private because we don't want
	# other things to mess with authentication token
	def create_auth_token
		self.auth_token = SecureRandom.url_Base64
	end
end

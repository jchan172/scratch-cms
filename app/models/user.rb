class User < ActiveRecord::Base
  attr_accessible :email, :name

  before_save {|user| user.email = email.downcase}
  validates :pword, presence: true, length: {minimum: 4, maximum: 30}
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, 
  			presence: true,
  			uniqueness: {case_sensitive: true},
  			format: {with: VALID_EMAIL_REGEX} 

end

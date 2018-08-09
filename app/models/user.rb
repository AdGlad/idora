class User < ActiveRecord::Base
  has_many :collections
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true , uniqueness: true, length: {minimum:3,maximum:30}
  validates :email, presence: true , uniqueness: true, length: {minimum:3,maximum:130},format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end

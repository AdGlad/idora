class User < ActiveRecord::Base
  validates :username, presence: true , uniqueness: true, length: {minimum:3,maximum:30}
  validates :email, presence: true , uniqueness: true, length: {minimum:3,maximum:130}
end

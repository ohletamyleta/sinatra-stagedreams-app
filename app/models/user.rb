class User < ActiveRecord::Base 
  has_many :shows
  has_secure_password
  validates :username, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true

end
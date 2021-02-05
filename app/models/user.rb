class User < ActiveRecord::Base 
  has_many :shows
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true


  def slug
    self.username.gsub(" ","-")
  end

  def self.find_by_slug(slug)
    name = slug.gsub("-"," ")
    User.find_by(username: name)
  end


end
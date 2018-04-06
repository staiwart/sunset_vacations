class User < ApplicationRecord
  before_save { email.downcase! }
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :name, presence: true, length: { maximum: 100 }
  validates(:email, presence: true, 
    length: { maximum: 254 }, 
    format: { with: EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false })
  validates :country, presence: true, length: { maximum: 45 }
  validates :password, presence: true, length: { minimum: 6}
  
  has_secure_password
end

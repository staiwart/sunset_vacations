class User < ApplicationRecord
  before_save { email.downcase! }
  
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  validates :name, presence: true, length: { maximum: 100 }
  validates(:email, presence: true, 
    length: { maximum: 254 }, 
    format: { with: EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false })
  validates :country, presence: true, length: { maximum: 45 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
end

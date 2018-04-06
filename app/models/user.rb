class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { email.downcase! }
  
  # Variables, Constants, etc.
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  
  # Attributes Validations
  validates :name, presence: true, length: { maximum: 100 }
  validates(:email, presence: true, 
    length: { maximum: 254 }, 
    format: { with: EMAIL_REGEX }, 
    uniqueness: { case_sensitive: false })
  validates :country, presence: true, length: { maximum: 45 }
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6}, allow_nil: true
  
  class << self
    # Encrypting Strings (returns the hash digest)
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # Generating Random Token (returns it)
    def new_token
      SecureRandom.urlsafe_base64
    end
  end
  
  # Remembers User (changes attribute)
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  # Authenticates Token
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  
  # Forgets User (changes attribute)
  def forget
    update_attribute(:remember_digest, nil)
  end
  
end
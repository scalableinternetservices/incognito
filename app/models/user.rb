class User < ApplicationRecord
 has_many :comments, dependent: :destroy
 acts_as_voter

def username
  return self.username
end




  attr_accessor :remember_token, :activation_token
  before_save { self.email = email.downcase   }
  before_save { self.username = username.downcase }
  before_create :create_activation_digest
 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true




  validates :username, presence: true, length: {maximum: 20},
                    uniqueness: true


  has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

  def edit
    @user = User.find(params[:id])
  end
  
  # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
 
  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end


  private
    # Creates and assigns the activation token and digest.
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
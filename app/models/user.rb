class User < ActiveRecord::Base
  # Gem Class Methods:  ----------------------------------------------------------------------------------------------
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates :email, presence: true
  validates :email, uniqueness: true

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  after_save :ensure_authentication_token!

  # Custom Methods:  --------------------------------------------------------------------------------------------------
  def ensure_authentication_token!
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
      self.save
    end
  end

  def reset_authentication_token!
    self.authentication_token = nil;
    self.save
  end
 
  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end

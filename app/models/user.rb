# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime
#  updated_at             :datetime
#  authentication_token   :string(255)
#  zipcode                :string(255)
#

class User < ActiveRecord::Base
  # Gem Class Methods:  ----------------------------------------------------------------------------------------------
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations:  -----------------------------------------------------------------------------------------------------
  validates :email,
            :password,
            presence: true

  validates :email,
            uniqueness: true

  # Callbacks:  -------------------------------------------------------------------------------------------------------
  after_save :ensure_authentication_token!

  # Public: Custom Methods:  --------------------------------------------------------------------------------------------------
  # sets the authentication_token property if User record doesn't have one 
  def ensure_authentication_token!
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
      self.save
    end
  end

  # removes the authentication_token from a user 
  def reset_authentication_token!
    self.authentication_token = nil;
    self.save
  end
 
  private
  
  # Private: Custom Methods:  --------------------------------------------------------------------------------------------------
  # returns a unique token to user as a authentication_token 
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end

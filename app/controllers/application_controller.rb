class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # This is our new function that comes before Devise's one
  # before_filter :authenticate_user_from_token!

  # This is Devise's authentication
  # before_action :authenticate_user!

private

  # Not sure if I will need these again
  # def authenticate_user_from_token!
  #   user_email = params[:email].presence
  #   user       = user_email && User.find_by_email(user_email)
  #   # Notice how we use Devise.secure_compare to compare the token
  #   # in the database with the token given in the params, mitigating
  #   # timing attacks.
  #   if user && Devise.secure_compare(user.authentication_token, params[:auth_token])
  #     sign_in user, store: false
  #   end
  # end
end

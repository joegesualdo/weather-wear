module Api
  module V1
    class BaseController < ApplicationController
      # Callbacks:  -------------------------------------------------------------------------------------------------------
      before_action :default_json

      # Public Methods  -------------------------------------------------------------------------------------------------------
      # Check if the request had a auth token in the params or header
      # If there is an auth token, find the user from the database 
      # that has a matching token
      def current_user
        auth_token = request.headers["X-AUTH-TOKEN"] || params[:auth_token]
        return nil unless auth_token
        User.find_by authentication_token: auth_token
      end

      # Protected: Methods  -------------------------------------------------------------------------------------------------------
      protected

      def default_json
        request.format = :json if params[:format].nil?
      end

      # Render the json error, if user isn't signed in
      def auth_only!
        render json: {message: "Must sign in", status: 401}, status: 401 unless current_user
      end
    end
  end
end

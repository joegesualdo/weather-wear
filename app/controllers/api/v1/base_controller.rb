module Api
  module V1
    class BaseController < ApplicationController
      respond_to :json
      before_action :default_json

      def current_user
        auth_token = request.headers["X-AUTH-TOKEN"] || params[:auth_token]
        return nil unless auth_token
        User.find_by authentication_token: auth_token
      end

      protected

      def default_json
        request.format = :json if params[:format].nil?
      end

      def auth_only!
        render json: {message: "Must sign in", status: 401}, status: 401 unless current_user
      end
    end
  end
end

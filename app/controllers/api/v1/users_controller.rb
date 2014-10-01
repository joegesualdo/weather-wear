module Api
  module V1
    class UsersController < BaseController
      # Callbacks:  -------------------------------------------------------------------------------------------------------
      # User needs to be authorized before accessing any actions
      before_action :auth_only!, except: [:create, :index, :show]
      before_action :set_user, only: [:show, :edit, :update, :destroy]

      # Actions:  -------------------------------------------------------------------------------------------------------
      def index
        if params[:ids]
          # Can take a parameter with multiple ids listed:
          #   /user?ids=1,2,3
          ids_array = params[:ids].split(",")
          @users = User.find(ids_array)
          render json: @users
        else
          @users = User.all
          render json: @users
        end
      end

      def show
        @user = User.find(params[:id])
        render json: @user 
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: 201
        else
          render json: {status: 'error', message: 'User was not signed in'}, status: 400
        end
      end

     # Private: Methods  -------------------------------------------------------------------------------------------------------
     private

     # Use callbacks to share common setup or constraints between actions.
     def set_user
       current_user
     end

     # Never trust parameters from the scary internet, only allow the white list
     # this defines what parameters we accepte for a user
     def user_params 
       params.require(:user).permit(:email, :password)
     end
    end
  end
end

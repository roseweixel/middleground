module Api
  module V1
    class SessionsController < ApplicationController
      skip_before_action :authenticate_user!

      def create
        @user = User.find_for_database_authentication(email: params[:email])
        return invalid_login_attempt unless @user

        if @user.valid_password?(params[:password])
          sign_in :user, @user
          @token = @user.create_new_auth_token
          render json: @user, serializer: SessionSerializer, root: nil, token: @token
        else
          invalid_login_attempt
        end
      end

      private

        def invalid_login_attempt
          warden.custom_failure!
          render json: {error: ('sessions_controller.invalid_login_attempt')}, status: :unprocessable_entity
        end
    end
  end
end

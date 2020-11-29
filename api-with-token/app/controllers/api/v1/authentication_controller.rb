module Api
  module V1
    class AuthenticationController < ApplicationController
      include JwtAuthenticator

      def token
        @current_user = User.find_by_email(params[:email])
        raise StandardError, 'ログインIDまたはパスワードが誤っています。' unless @current_user&.valid_password?(params[:password])

        jwt_token = encode(@current_user.email)
        response.headers['X-Authentication-Token'] = jwt_token
        render json: @current_user
      end
    end
  end
end

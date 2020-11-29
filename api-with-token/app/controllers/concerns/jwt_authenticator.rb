module JwtAuthenticator
  require 'jwt'
  extend ActiveSupport::Concern

  SECRET_KEY = Rails.application.secrets.secret_key_base

  def jwt_authenticate
    raise StandardError, '認証情報が不足しています。' if request.headers['Authorization'].blank?

    encoded_token = request.headers['Authorization'].split('Bearer ').last
    payload = decode(encoded_token)
    @current_user = User.find_by_email(payload['user_id'])
    raise StandardError, '認証できません。' if @current_user.blank?

    @current_user
  end

  def encode(user_id)
    expires_in = 1.month.from_now.to_i
    preload = { user_id: user_id, exp: expires_in }
    JWT.encode(preload, SECRET_KEY, 'HS256')
  end

  def decode(encoded_token)
    decoded_dwt = JWT.decode(encoded_token, SECRET_KEY, true, algorithm: 'HS256')
    decoded_dwt.first
  end
end

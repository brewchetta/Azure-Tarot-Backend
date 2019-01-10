# For secret token
require 'token_secret'

class ApplicationController < ActionController::API
  before_action :authorized

  # Defined in token_secret file
  include TokenSecret

# Validations with JWT

  def encode_token(payload)
    JWT.encode(payload, secret_token)
  end

  def auth_header
    request.headers['Authorization']
  end

  def decoded_token
    if auth_header
      token = aut_header.split(' ')[1]
      begin
        JWT.decode(token, secret_token, true)
      rescue JWT::DecodeError
        nil
      end
    end
  end

  def current_user
    if decoded_token
      user_id = decoded_token[0]['user_id']
      @user = User.find_by(id: user_id)
    end
  end

  def logged_in?
    !!current_user
  end

  def authorized
    render json: { message: 'Log in por favor' }, status: :unauthorized unless logged_in?
  end

end

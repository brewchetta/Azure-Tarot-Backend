class Api::V1::AuthController < ApplicationController
  before_action :find_user
  skip_before_action :authorized, only: [:create]

  def create
    if @user && @user.authenticate(user_login_params[:password])
      @token = encode_token( user_id: @user.id )
      render json: { user: @user, jwt: @token }, status: :accepted
    else
      render json: { message: 'Invalid login' }, status: :unauthorized
    end
  end



private

  def find_user
    @user = User.find_by(username: user_login_params[:username])
  end

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

end

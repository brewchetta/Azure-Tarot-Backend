class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def show_by_name
    render json: { user: current_user }, status: :accepted
  end

  def create
    if @user && @user.authenticate(user_login_params[:password])
      @token = encode_token( user_id: @user.id )
      render json: { user: @user, jwt: @token }, status: :accepted
    else
      render json: { message: 'Invalid login' }, status: :unauthorized
    end
  end

private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

end

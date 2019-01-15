class Api::V1::AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def show_by_name
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end

  def create
    @user = User.find_by(username: params[:user][:username])
    puts 'User is:'
    puts @user
    puts '---------'
    if @user && @user.authenticate(params[:user][:password])
      @token = encode_token( user_id: @user.id )
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
    else
      render json: { message: 'Invalid login' }, status: :unauthorized
    end
  end

private

  def user_login_params
    params.require(:user).permit(:username, :password)
  end

end

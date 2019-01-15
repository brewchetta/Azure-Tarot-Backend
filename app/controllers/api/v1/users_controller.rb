class Api::V1::UsersController < ApplicationController
  before_action :get_user, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:create, :show, :show_by_name]

  def index
    @users = User.all
    render json: { users: @users, status: :ok}
  end

  def show
    render json: {user: UserSerializer.new(@user), status: :ok}
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      @token = encode_token(user_id: @user.id)
      render json: {user: UserSerializer.new(@user), jwt: @token, status: :created}
    else
      render json: {errors: @user.errors.full_messages[0], status: :not_acceptable}
    end
  end

  def update
    @user.update
    if @user.valid?
      render json: {user: @user, status: :accepted}
    else
      render json: {status: :not_acceptable}
    end
  end

  def destroy
    @user.delete
    if @user
      render json: {status: :accepted}
    else
      render json: {status: :not_acceptable}
    end
  end

  private

  def get_user
    @user = User.all.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end

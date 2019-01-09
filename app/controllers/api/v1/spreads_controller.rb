class Api::V1::SpreadsController < ApplicationController
  before_action :get_spread, only: [:show, :update, :destroy]

  def index
    @spreads = Spread.all
    render json: { spreads: @spreads, status: :ok}
  end

  def show
    render json: {spread: @spread, status: :ok}
  end



  private

  def get_spread
    @spread = Spread.all.find_by(id: params[:id])
  end

  def spread_params
    params.require(:spread).permit(:type, :user_id)
  end

end

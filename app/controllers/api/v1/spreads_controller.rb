class Api::V1::SpreadsController < ApplicationController
  before_action :get_spread, only: [:show, :update, :destroy]

  def index
    @spreads = Spread.all
    render json: { spreads: @spreads, status: :ok}
  end

  def show
    render json: {spread: @spread, status: :ok}
  end

  def create
    @spread = Spread.create(spread_params)
    if @spread.valid?
      render json: { spread: @spread, status: :created }
    else
      render json: { errors: @spread.errors.full_messages[0], status: :not_acceptable }
    end
  end

  private

  def get_spread
    @spread = Spread.all.find_by(id: params[:id])
  end

  def spread_params
    params.require(:spread).permit(:spread_type, :user_id, {card_ids:[]})
  end

end

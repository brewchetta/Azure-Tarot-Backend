class Api::V1::PositionsController < ApplicationController
  before_action :get_position, only: [:show, :update, :destroy]

  def index
    @positions = Position.all
    render json: { positions: @positions, status: :ok}
  end

  def show
    render json: {position: @position, status: :ok}
  end

  def create
    @position = Position.create(position_params)
    if @position.valid?
      render json: {position: @position, status: :created}
    else
      render json: { errors: @position.errors.full_messages[0], status: :not_acceptable }
    end
  end


  private

  def get_position
    @position = Position.all.find_by(id: params[:id])
  end

  def position_params
    params.require(:position).permit(:position_name, :spread_id)
  end

end

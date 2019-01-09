class Api::V1::PositionsController < ApplicationController
  before_action :get_position, only: [:show, :update, :destroy]

  def index
    @positions = Position.all
    render json: { positions: @positions, status: :ok}
  end

  def show
    render json: {position: @position, status: :ok}
  end



  private

  def get_position
    @position = Position.all.find_by(id: params[:id])
  end

  def position_params
    params.require(:position).permit(:position_name, :spread_id)
  end

end

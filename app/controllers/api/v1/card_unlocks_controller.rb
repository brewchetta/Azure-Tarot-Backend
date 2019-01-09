class Api::V1::CardUnlocksController < ApplicationController
  before_action :get_card_unlock, only: [:show, :update, :destroy]

  def index
    @card_unlocks = CardUnlock.all
    render json: { card_unlocks: @card_unlocks, status: :ok}
  end

  def show
    render json: {card_unlock: @card_unlock, status: :ok}
  end



  private

  def get_card_unlock
    @card_unlock = CardUnlock.all.find_by(id: params[:id])
  end

  def card_unlock_params
    params.require(:card_unlock).permit(:user_id)
  end

end

class Api::V1::CardsController < ApplicationController
  before_action :get_card, only: [:show, :update, :destroy]
  skip_before_action :authorized

  def index
    @cards = Card.all
    render json: { cards: @cards, status: :ok}
  end

  def show
    render json: {card: @card, status: :ok}
  end

  def create
    @card = Card.create(card_params)
    if @card.valid?
      render json: {card: @card, status: :accepted}
    else
      render json: {errors: @card.errors.full_messages[0], status: :not_acceptable}
    end
  end

  def update
    @card.update
    if @card.valid?
      render json: {card: @card, status: :accepted}
    else
      render json: {status: :not_acceptable}
    end
  end

  def destroy
    @card.destroy
    if @card
      render json: {status: :accepted}
    else
      render json: {status: :not_acceptable}
    end
  end

  private

  def get_card
    @card = Card.all.find_by(id: params[:id])
  end

  def card_params
    params.require(:card).permit(:card_name, :card_rank, :card_suit, :description, :rev_description, {keywords:[]}, {rev_keywords:[]}, :major_arcana)
  end

end

class Api::V1::NotesController < ApplicationController

  def create
    @note = Note.create(note_params)
    if @note.valid?
      @spread = Spread.all.find_by(id: [@note.spread_id])
      render json: { spread: SpreadSerializer.new(@spread), status: :created }
    else
      render json: { errors: @note.errors.full_messages[0], status: :not_acceptable }
    end
  end

  private

  def get_note
    @note = Note.all.find_by(id: params[:id])
  end

  def note_params
    params.require(:note).permit(:content, :spread_id)
  end

end

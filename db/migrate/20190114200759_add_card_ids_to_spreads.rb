class AddCardIdsToSpreads < ActiveRecord::Migration[5.2]
  def change
    # Keywords can be in an array thanks to serialize in model
    add_column :spreads, :card_ids, :string
  end
end

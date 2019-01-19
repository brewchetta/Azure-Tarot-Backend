class AddUserDescriptionToCardUnlock < ActiveRecord::Migration[5.2]
  def change
    add_column :card_unlocks, :user_description, :string
  end
end

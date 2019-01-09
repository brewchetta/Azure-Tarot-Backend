class CreateCardUnlocks < ActiveRecord::Migration[5.2]
  def change
    create_table :card_unlocks do |t|
      t.integer :user_id
      t.integer :card_id

      t.timestamps
    end
  end
end

class CreateSpreads < ActiveRecord::Migration[5.2]
  def change
    create_table :spreads do |t|
      t.string :type
      t.integer :user_id

      t.timestamps
    end
  end
end

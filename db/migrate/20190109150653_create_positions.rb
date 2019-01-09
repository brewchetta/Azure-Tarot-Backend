class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.integer :spread_id
      t.string :position_name

      t.timestamps
    end
  end
end

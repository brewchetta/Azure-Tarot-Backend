class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.string :content
      t.integer :spread_id

      t.timestamps
    end
  end
end

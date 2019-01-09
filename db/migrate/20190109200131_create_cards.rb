class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :card_name
      t.string :card_suit
      t.string :description
      t.string :rev_description
      # Array allowed for keywords thanks to serialize in model
      t.string :keywords
      t.string :rev_keywords
      t.boolean :major_arcana, default: true

      t.timestamps
    end
  end
end
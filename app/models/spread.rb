class Spread < ApplicationRecord
  belongs_to :user
  has_many :positions
  has_many :notes, dependent: :destroy

  serialize :card_ids, Array
end

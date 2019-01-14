class Spread < ApplicationRecord
  belongs_to :user
  has_many :positions

  serialize :card_ids, Array
end

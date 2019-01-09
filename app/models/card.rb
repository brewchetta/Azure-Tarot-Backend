class Card < ApplicationRecord
  has_many :card_unlocks
  has_many :users, through: :card_unlocks

# Can store keywords in an array
  serialize :keywords, Array
  serialize :rev_keywords, Array
end

class Spread < ApplicationRecord
  belongs_to :user
  has_many :positions
end

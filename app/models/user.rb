class User < ApplicationRecord

# Validations

  validates :username, uniqueness: true
  validates :username, presence: true
  validates :username, length: { in: 6..20 }
  validates :password_digest, length: { in: 6..20 }

# Associations

  has_many :cards_unlocks
  has_many :cards, through: :card_unlocks
  has_many :spreads

end

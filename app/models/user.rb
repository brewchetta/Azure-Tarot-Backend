class User < ApplicationRecord
  has_secure_password

# Validations

  validates :username, uniqueness: { case_sensitive: false }
  validates :username, presence: true
  validates :username, length: { in: 6..20 }
  validates :password, length: { in: 6..20 }

# Associations

  has_many :card_unlocks
  has_many :cards, through: :card_unlocks
  has_many :spreads

end

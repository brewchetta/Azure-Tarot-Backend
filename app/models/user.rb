class User < ApplicationRecord
  has_secure_password

# Validations

  validates :username, uniqueness: { case_sensitive: false }
  validates :username, presence: true
  validates :username, length: { in: 6..20 }

# Associations

  has_many :card_unlocks, dependent: :destroy
  has_many :spreads, dependent: :destroy

end

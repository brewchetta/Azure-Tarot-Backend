class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :created_at, :profile

  has_many :cards
  has_many :card_unlocks
  has_many :spreads
end

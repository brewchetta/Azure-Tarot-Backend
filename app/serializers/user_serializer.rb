class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :created_at

  has_many :cards
  has_many :spreads
end
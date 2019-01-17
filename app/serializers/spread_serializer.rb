class UserSerializer < ActiveModel::Serializer
  attributes :spread_type, :user_id, :created_at, :card_ids

  has_many :notes
end

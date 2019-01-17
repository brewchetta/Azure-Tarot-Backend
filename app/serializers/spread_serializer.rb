class SpreadSerializer < ActiveModel::Serializer
  attributes :id, :spread_type, :user_id, :created_at, :card_ids

  has_many :notes
end

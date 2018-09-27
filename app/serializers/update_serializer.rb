class UpdateSerializer < ActiveModel::Serializer
  attributes :id, :date, :notes, :complete
  has_many :comments
end

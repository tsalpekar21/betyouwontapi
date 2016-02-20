class DareSerializer < ActiveModel::Serializer
  attributes :id, :dare, :description
  has_many :payments
  belongs_to :user
end

class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :amount
  belongs_to :dare
end

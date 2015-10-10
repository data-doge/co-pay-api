class PaymentSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_one :user
  has_one :purchase

  attributes :id, :amount
end
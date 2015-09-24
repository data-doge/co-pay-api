class PurchaseSerializer < ActiveModel::Serializer
  embed :ids, include: true
  has_one :user
  has_one :group
  attributes :id, :description, :description, :amount, :created_at
end
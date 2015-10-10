class Payment < ActiveRecord::Base
  belongs_to :user
  belongs_to :purchase
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 } 
end

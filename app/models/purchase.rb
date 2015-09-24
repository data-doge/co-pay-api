class Purchase < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  validates :description, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 } 
end

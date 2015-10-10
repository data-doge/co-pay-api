class Purchase < ActiveRecord::Base
  belongs_to :group
  belongs_to :user

  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 } 
  has_many :payments
end

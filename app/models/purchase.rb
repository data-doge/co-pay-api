class Purchase < ActiveRecord::Base
  belongs_to :group
  belongs_to :user
  validates :description, presence: true
  validates :amount, presence: true
  validates :amount, numericality: { greater_than: 0 } 
  has_many :payments

  after_create :generate_payments

  private
    def generate_payments
      num_users = group.users.length
      users = group.users.select { |u| u.id != user.id }
      users.each { |u| payments.create(amount: amount / num_users, user: u) }
    end
end

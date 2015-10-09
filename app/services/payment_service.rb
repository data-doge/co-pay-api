class PaymentService
  def self.generate_payments_for_purchase(purchase: , user_ids: )
    num_payments = user_ids.length
    payment_amount = purchase.amount / num_payments
    user_ids.each do |user_id|
      purchase.payments.create(user_id: user_id, amount: payment_amount)
    end
  end
end
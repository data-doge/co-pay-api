class PaymentsController < AuthenticatedController
  def index
    purchase = Purchase.find(params[:purchase_id])
    render json: purchase.payments
  end
end
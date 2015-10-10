class PurchasesController < AuthenticatedController
  def index
    purchases = Purchase.where(group_id: params[:group_id])
    render json: purchases
  end

  def create
    user_ids = params[:user_ids]
    purchase = Purchase.create(purchase_params_create)
    PaymentService.generate_payments_for_purchase(purchase: purchase, user_ids: user_ids)
    render json: [purchase]
  end

  private
    def purchase_params_create
      params.require(:purchase).permit(:description, :details, :amount, :group_id).merge(user_id: current_user.id)
    end
end
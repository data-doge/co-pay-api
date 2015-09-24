class PurchasesController < AuthenticatedController
  def index
    purchases = Purchase.where(group_id: params[:group_id])
    render json: purchases
  end
end
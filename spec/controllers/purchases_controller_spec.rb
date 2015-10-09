require 'rails_helper'

RSpec.describe PurchasesController, type: :controller do
  describe "#create" do
    before do
      @group = create(:group)
      @current_user = create(:user)

      sign_in @current_user
      request.headers.merge!(@current_user.create_new_auth_token)

      create(:membership, user: @current_user, group: @group)
      
      5.times do
        user = create(:user)
        create(:membership, group: @group, user: user)
      end

      @payment_recipients = @group.users.last(3)
      @payment_recipient_ids = @payment_recipients.map { |u| u.id }

      @purchase_params = attributes_for(:purchase)

      post :create, {purchase: @purchase_params, user_ids: @payment_recipient_ids}
      @parsed_response = JSON.parse(response.body)
      @created_purchase = Purchase.find_by(@purchase_params)
    end

    it "generates a purchase with specified params" do
      expect(@created_purchase).to be_truthy
    end

    it "returns the purchase as json" do
      expect(@parsed_response["purchases"][0]["description"]).to eq(@purchase_params[:description])
    end

    it "generates payments for each user in params[:user_ids]" do
      expected_payment_amount = @purchase_params[:amount] / @payment_recipients.length

      @payment_recipients.each do |u|
        payment = Payment.find_by(
          user_id: u.id, 
          amount: expected_payment_amount, 
          purchase_id: @created_purchase.id
        )
        expect(payment).to be_truthy
      end
    end
  end
end
class RenamePriceToAmountForPurchase < ActiveRecord::Migration
  def change
    rename_column :purchases, :price, :amount
  end
end

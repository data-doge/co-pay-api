class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :description
      t.text :details
      t.float :price
      t.belongs_to :user, index: true
      t.belongs_to :group, index: true
      
      t.timestamps null: false
    end
  end
end

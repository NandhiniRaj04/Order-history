class CreateOrderDetails < ActiveRecord::Migration[7.1]
  def change
    create_table :order_details do |t|
      t.string :user_email
      t.string :product_code
      t.datetime :order_date

      t.timestamps
    end
  end
end

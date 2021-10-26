class AddStripeProductIdToCar < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :stripe_product_id, :string
  end
end

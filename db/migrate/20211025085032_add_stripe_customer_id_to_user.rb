class AddStripeCustomerIdToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :strip_cutomer_id, :string
  end
end

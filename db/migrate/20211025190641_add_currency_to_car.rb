class AddCurrencyToCar < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :currency, :string
  end
end

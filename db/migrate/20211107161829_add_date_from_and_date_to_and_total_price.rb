class AddDateFromAndDateToAndTotalPrice < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :dateFrom, :string
    add_column :books, :dateTo, :string
    add_column :books, :totalPrice, :integer
  end
end

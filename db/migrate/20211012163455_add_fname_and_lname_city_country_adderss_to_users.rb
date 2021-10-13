class AddFnameAndLnameCityCountryAdderssToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :fname,:string
    add_column :users, :lname,:string
    add_column :users, :city,:string
    add_column :users, :address,:string
    add_column :users, :phone,:string
    add_column :users, :country,:string
  end
end

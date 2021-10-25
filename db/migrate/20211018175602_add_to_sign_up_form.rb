class AddToSignUpForm < ActiveRecord::Migration[6.1]
  def change
    add_column :users ,:companyname, :string
    add_column :users ,:image, :string
  end
end

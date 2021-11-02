class ChangeCityToState < ActiveRecord::Migration[6.1]
  def change
    rename_column :users , :city,:state
  end
end

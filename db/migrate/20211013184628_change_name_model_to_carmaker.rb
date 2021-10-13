class ChangeNameModelToCarmaker < ActiveRecord::Migration[6.1]
  def change
    rename_column :cars, :name, :carmakes
    rename_column :cars, :model, :carmodels
    rename_column :cars, :publish, :caryears
  end
end

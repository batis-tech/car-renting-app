class ChangeStateToStateCont < ActiveRecord::Migration[6.1]
  def change
    rename_column :users, :country,:country_cont
    rename_column :users, :state,:state_cont
  end
end

class Creat < ActiveRecord::Migration[6.1]
  def change
    create_table(:clients_roles, :id => false) do |t|
      t.references :user
      t.references :role
    end
      add_index(:clients_roles, [ :user_id, :role_id ])
  end
end

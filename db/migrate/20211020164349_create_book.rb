class CreateBook < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :price
      t.string  :name
      t.string :number
      t.references :car, null: false, foreign_key: true
      t.timestamps
    end
  end
end

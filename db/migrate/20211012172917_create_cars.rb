class CreateCars < ActiveRecord::Migration[6.1]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :model
      t.text :image
      t.string :publish
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

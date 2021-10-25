class AddimageCacheTocars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :image_cache, :string
  end
end

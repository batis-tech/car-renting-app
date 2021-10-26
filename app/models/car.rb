class Car < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :user

  after_create do
    car = Stripe::Product.create(name: carmakes)
    price = Stripe::Price.create(product: car,unit_amount: self.price, currency: 'usd')
    update(stripe_product_id:  car.id)
  end
end

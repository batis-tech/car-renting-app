class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cars
  has_many :books
  def full_name
  "#{fname} #{lname}"
  end

  def to_s
   email
  end


  after_create do
    customer = Stripe::Customer.create(email: email)
    update(strip_cutomer_id:  customer.id)
  end


end

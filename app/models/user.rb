class User < ApplicationRecord
  rolify
  after_create :assign_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :cars ,  dependent: :destroy
  has_many :books ,  dependent: :destroy

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

  def assign_default_role
   @user = User.where(role: 2 )
   if @user
   self.add_role :customer
  else
    self.add_role :admin
  end
 end


end

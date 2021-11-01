class ProfileController < ApplicationController
  before_action :restrict, only: %i[ index  invoice]
  def index
    @invoice = current_user.id
  end
  def invoice
    @user =  Stripe::Customer.retrieve(current_user.strip_cutomer_id)
    @payment = Stripe::PaymentIntent.list(customer:@user.id )
    @list = Stripe::PaymentIntent.list(customer:@user.id )

    # @total = count(@payment.amount)
    # @invoice = Stripe::Invoice.list(customer:@user.id)
    # @product = Stripe::Product.retrieve('prod_KTm6NJN3myCQ6j')
  end

  private

  def restrict
    if current_user.has_role? :admin
    else
      redirect_to root_path
    end
  end

end

class ProfileController < ApplicationController
  def index
    @invoice = current_user.id
  end
  def invoice
    @payment = Book.where(user_id: current_user.id)
    # @total = count(@payment.amount)
    @ordePrices = @payment.sum(:totalPrice)

    @numberOfOrde = @payment.count

    #
    # @product = Stripe::Product.retrieve('prod_KTm6NJN3myCQ6j')
  end

  private


end

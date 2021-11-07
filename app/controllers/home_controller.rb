class HomeController < ApplicationController
   before_action :authenticate_user!, only: %i[ book ]
   before_action :book_params,only: %i[ create ]
	# before_action :check_signed_in
def index
  @search= User.ransack (params[:q])
  @searchs = @search.result(distink: true)
  @car = Car.limit(4)

end

def search
  @search= User.ransack (params[:q])
  @search= Car.ransack (params[:q])
  @searchs = @search.result(distink: true)
  @car_caryears_cont = ['2021']
  @car_carmakes_cont = ['Audi']
  @car_carmodels_cont = ['233']
end



def book
    @from = params[:dateform]
    @to = params[:dateto]
    @totalDays = (@to.to_date - @from.to_date).to_i
    @price = params[:price].to_i
    @totalPrice = (@price * @totalDays)
    if @totalPrice  < 1
       @totalPrice = @price
     else
        @totalPrice
    end
    @car = Car.find(params[:id])
    @book = Book.new

end

def create
  @book = Book.new(book_params)
  payment_intent = Stripe::PaymentIntent.create({
  customer: current_user.strip_cutomer_id,
  amount: @book.price ,
  currency: 'usd',
})
 # render json:
 @card = payment_intent.payment_method_types
 @payment_intent_confirm = Stripe::PaymentIntent.confirm(
  payment_intent.id,
  {payment_method: 'pm_card_visa'}
)
 if @payment_intent_confirm
  @book.stripe_payment_id = payment_intent.id
  respond_to do |format|
   if @book.save
       format.html { redirect_to invoice_path, notice: "Car was successfully created." }
   else
       format.html { render json: @book.errors, status: :unprocessable_entity }

   end
  end
 else
    render json: payment_intent
 end

  # @car = Car.find(params[:id])
  # @user =current_user.strip_cutomer_id
  # @session = Stripe::Checkout::Session.create({
  #   customer: current_user.strip_cutomer_id,
  #   client_reference_id: params[:client_id],
  #   payment_method_types: ['card'],
  #   line_items: [{
  #   name:@car.carmakes,
  #   amount:params[:total],
  #   currency:"usd",
  #   quantity:params[:day],
  #   }],
  #   mode: 'payment',
  #   success_url: 'http://localhost:3000/invoice',
  #   cancel_url: 'http://localhost:3000/',
  #   });
  #
  #   redirect_to @session.url

end

# def check_signed_in
#   redirect_to business_path if user_signed_in?
# end
private

def book_params
  params.require(:book).permit(:price, :name, :number, :car_id, :user_id,:stripe_payment_id,:status,:dateFrom,:dateTo,:totalPrice)
end

end

class HomeController < ApplicationController

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
  @array_of_caryears = ['2021']
  @array_of_carmakes = ['Audi']
  @array_of_carmodels = ['233']
end



def book
    @from = params[:dateform]
    @to = params[:dateto]
    @total = (@to.to_d - @from.to_d ).to_i
    @price = params[:price].to_i
    @totalPrice = (@price * @total)
    @car = Car.find(params[:id])
    @book = Book.new

end

def create
  @car = Car.find(params[:id])
  @user =current_user.strip_cutomer_id
  @session = Stripe::Checkout::Session.create({
    customer: current_user.strip_cutomer_id,
    payment_method_types: ['card'],
    line_items: [{
    name:@car.carmakes,
    amount:@car.price,
    currency:"usd",
    quantity:1,
    receipt_email: current_user.email,
    }],
    mode: 'payment',
    success_url: "http://localhost:3000/invoice",
    cancel_url: 'http://localhost:3000/',
    });
  redirect_to @session.url

end
# def check_signed_in
#   redirect_to business_path if user_signed_in?
# end
private

def book_params
  params.require(:book).permit(:price, :name, :number, :car_id, :user_id)
end

end

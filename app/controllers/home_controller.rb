class HomeController < ApplicationController

	# before_action :check_signed_in
def index
  @search= Car.ransack (params[:q])
 @searchs = @search.result(distink: true)
end

def search
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
   @session = Stripe::Checkout::Session.create({
    customer: current_user.strip_cutomer_id,
    payment_method_types: ['card'],
    line_items: [{
    name:@car.carmakes,
    amount:@car.price,
    currency:"usd",
    quantity:1
  }],
  mode: 'payment',
  success_url: root_url,
  cancel_url: root_url,
});
   redirect_to @session.url
 end
# def check_signed_in
#   redirect_to business_path if user_signed_in?
# end
private

end

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
    @total = (@to.to_date - @from.to_date ).to_i
    @price = params[:price].to_i
    @totalPrice = (@price * @total)
    @car = Car.find(params[:id])
    @book = Book.new

end
 def booking
  
 end
# def check_signed_in
#   redirect_to business_path if user_signed_in?
# end
private

end

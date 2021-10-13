class HomeController < ApplicationController
	before_action :check_signed_in
def index

end
def check_signed_in
  redirect_to business_path if user_signed_in?
end
end

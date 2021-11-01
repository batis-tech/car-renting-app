class BusinessController < ApplicationController
  before_action :authenticate_user!
  before_action :restrict

  def index
    if current_user.has_role? :admin

    else
      redirect_to root_path
    end
  end

  private
  
  def restrict
    if current_user.has_role? :admin
    else
      redirect_to root_path
    end
  end

end

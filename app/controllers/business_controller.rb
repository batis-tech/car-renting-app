class BusinessController < ApplicationController

  before_action :restrict, only: %i[index ]

  def index
    @car = Car.where(user_id: current_client.id)
    @PaymentIntent = Stripe::PaymentIntent.list()
  end

  private

  def restrict
    if @current_user == current_client
      authenticate_client!
    elsif @current_user == current_user
      root_path
    end
  end

end

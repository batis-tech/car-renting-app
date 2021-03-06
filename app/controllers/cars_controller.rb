class CarsController < ApplicationController
  before_action :set_car, only: %i[ show edit update destroy ]
  before_action :restrict, only: %i[index show edit update destroy]

  # GET /cars or /cars.json
  def index
    @car = Car.where(user_id: current_client.id)
  end

  # GET /cars/1 or /cars/1.json
  def show
  end

  # GET /cars/new
  def new
    @car = Car.new
    @array_of_caryears = ['2021']
    @array_of_carmakes = ['Audi']
    @array_of_carmodels = ['233']
    @user = current_client.id
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars or /cars.json
  def create
    @car = Car.new(car_params)

    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: "Car was successfully created." }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1 or /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: "Car was successfully updated." }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1 or /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: "Car was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_car
      @car = Car.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def car_params
      params.require(:car).permit(:carmakes, :carmodels, :image, :caryears, :user_id, :image_cache,:price,:stripe_product_id)
    end

    def restrict
    if @current_user == current_client
      authenticate_client!
    elsif @current_user == current_user
      root_path
    end
  end


end

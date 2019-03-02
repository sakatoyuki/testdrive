class Admin::CarsController < ApplicationController
  layout "admin/stocks"

  #def new
  #  @car = Car.new
  #end

  #def create
  #  dealer = Dealer.find(params[:id])
  #  @car = dealer.cars.new(car_params)
  #  if @car.save
  #    redirect_to admin_cars_path, notice: "「#{@car.name}」を登録しました"
  #  else
  #    Rails.logger.debug(@car.errors.messages)
  #    render :new
  #  end
  #end

  def edit
    @car = current_dealer.cars.find(params[:id])
  end

  def show
    @car = current_dealer.cars.find(params[:id])
  end

  def index
    @cars = current_dealer.cars
  end

  def update
    @car = current_dealer.cars.find(params[:id])

    if @car.update(car_params)
      redirect_to admin_cars_path, notice: "「#{@car.name}」を更新しました"
    else
      render :new
    end
  end

  def destroy
    @car = current_dealer.cars.find(params[:id])
    @car.destroy
    redirect_to admin_cars_url, notice: "「#{@car.name}」を削除しました"
  end


  private

  def car_params
    params.require(:car).permit(:name, :count, :car_image)
  end
end

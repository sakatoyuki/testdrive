class Admin::CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to admin_cars_path, notice: "「#{@car.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @car = Car.find(params[:id])
  end

  def show
    @car = Car.find(params[:id])
  end

  def index
    @cars = Car.all
  end

  def update
    @car = Car.find(params[:id])

    if @car.update(car_params)
      redirect_to admin_cars_path, notice: "「#{@car.name}」を更新しました"
    else
      render :new
    end
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to admin_cars_url, notice: "「#{@car.name}」を削除しました"
  end


  private

  def car_params
    params.require(:car).permit(:name, :waiting_spot, :map_image)
  end
end

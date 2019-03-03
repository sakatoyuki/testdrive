class Admin::DealersController < ApplicationController
  layout "admin/stocks"

  def new
    @dealer = Dealer.new
  end

  def create
    @dealer = Dealer.new(dealer_params)

    if @dealer.save
      redirect_to admin_dealers_path, notice: "ディーラー「#{@dealer.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @dealer = Dealer.find(params[:id])
  end

  def show
    @dealer = Dealer.find(params[:id])
  end

  def index
    @dealers = Dealer.all
  end

  def update
    @dealer = Dealer.find(params[:id])

    if @dealer.update(dealer_params)
      redirect_to admin_dealers_path, notice: "ディーラー「#{@dealer.name}」を更新しました"
    else
      render :new
    end
  end

  def destroy
    @dealer = Dealer.find(params[:id])
    @dealer.destroy
    redirect_to admin_dealers_url, notice: "ディーラー「#{@dealer.name}」を削除しました"
  end

  def new_station
    @station = Station.new
  end

  def create_station
    dealer = Dealer.find(params[:id])
    @station = dealer.stations.new(station_params)

    if @station.save
      redirect_to admin_stations_path, notice: "「#{@station.name}」駅を登録しました"
    else
      render :new
    end
  end

  def new_car
    @car = Car.new
  end

  def create_car
    dealer = Dealer.find(params[:id])
    @car = dealer.cars.new(car_params)
    if @car.save
      redirect_to admin_cars_path, notice: "「#{@car.name}」を登録しました"
    else
      Rails.logger.debug(@car.errors.messages)
      render :new
    end
  end


  private

  def dealer_params
    params.require(:dealer).permit(:name, :login_id, :password, :password_confirmation)
  end

  def station_params
    params.require(:station).permit(:name, :waiting_spot, :map_image)
  end

  def car_params
    params.require(:car).permit(:name, :count, :car_image)
  end

end

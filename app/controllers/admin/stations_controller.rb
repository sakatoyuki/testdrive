class Admin::StationsController < ApplicationController
  layout "admin/stocks"

  #def new
  #  @station = Station.new
  #end

  #def create
  #  dealer = Dealer.find(params[:id])
  #  @station = dealer.stations.new(station_params)
  #    if @station.save
  #      redirect_to admin_stations_path, notice: "「#{@station.name}」駅を登録しました"
  #    else
  #      render :new
  #    end
  #end

  def edit
    @station = current_dealer.station.find(params[:id])
  end

  def show
    @station = current_dealer.station.find(params[:id])
  end

  def index
    @stations = current_dealer.stations
  end

  def update
    @station = current_dealer.station.find(params[:id])

    if @station.update(station_params)
      redirect_to admin_stations_path, notice: "「#{@station.name}」駅を更新しました"
    else
      render :new
    end
  end

  def destroy
    @station = current_dealer.station.find(params[:id])
    @station.destroy
    redirect_to admin_stations_url, notice: "「#{@station.name}」駅を削除しました"
  end


  private

  def station_params
    params.require(:station).permit(:name, :waiting_spot, :map_image)
  end

end

class Admin::StocksController < ApplicationController
  def new
    @stock = Stock.new
    @stocks = Stock.includes(:car).all
    @cars = current_dealer.cars
  end

  def create
    binding.pry
    stocks = []
    hah = {}
    params[:stock][:stocks].each do |stock|
      next if stock[:date] === "" || stock[:availables] === ""
      hah = {date: stock[:date],
             time: stock[:time],
             availables: stock[:availables],
             car_id: stock_params[:car_id][0]
           }
      begin
        Stock.new(date: hah[:date],
                  time: hah[:time],
                  car_id: hah[:car_id],
                  availables: hah[:availables]).save
      rescue => e
        p e.messages
        flash.now[:danger] = "登録に失敗しました。"
      end
    end
    flash.now[:danger] = "登録に成功しました。"
    redirect_to admin_root_path
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def index
    @stocks = Stock.includes(:car).all
  end

  def update
    @stock = Stock.find(params[:id])

    if @stock.update(stock_params)
      redirect_to admin_stocks_path, notice: "「#{@stock.name}」を更新しました"
    else
      render :new
    end
  end

  def destroy
    @stock = Stock.find(params[:id])
    @stock.destroy
    redirect_to admin_stocks_url, notice: "「#{@stock.name}」を削除しました"
  end


  private

  def stock_params
    params.require(:stock).permit(:name, :date, :time, :availables,
      { :car_id => []}, {:stocks => []},
    stocks_attributes: [:id, :time, :availables, :car_id]
    )
  end
end

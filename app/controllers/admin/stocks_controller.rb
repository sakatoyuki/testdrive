class Admin::StocksController < ApplicationController
  def new
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(stock_params)

    if @stock.save
      redirect_to admin_stocks_path, notice: "「#{@stock.name}」を登録しました"
    else
      render :new
    end
  end

  def edit
    @stock = Stock.find(params[:id])
  end

  def show
    @stock = Stock.find(params[:id])
  end

  def index
    @stocks = Stock.all
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
    params.require(:stock).permit(:name, :waiting_spot, :map_image)
  end
end

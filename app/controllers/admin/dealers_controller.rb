class Admin::DealersController < ApplicationController
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
    @user.destroy
    redirect_to admin_dealers_url, notice: "ディーラー「#{@dealer.name}」を削除しました"
  end


  private

  def dealer_params
    params.require(:dealer).permit(:name, :login_id, :password, :password_confirmation)
  end

end

class Admin::SessionsController < ApplicationController
  skip_before_action :login_dealer_required

  layout "admin/stocks"

  def new
  end

  def create
    dealer = Dealer.find_by(login_id: session_params[:login_id])

    if dealer&.authenticate(session_params[:password])
      session[:dealer_id] = dealer.id
      redirect_to admin_root_path, notice: "ログインしました。"
    else
      flash.now[:danger] = "ログインに失敗しました。"
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to "#", notice: "ログアウトしました。"
  end


  private

  def session_params
    params.require(:session).permit(:login_id, :password)
  end

end

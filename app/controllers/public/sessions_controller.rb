class Public::SessionsController < ApplicationController
  #skip_before_action :login_user_required

  def new
  end

  def create
    user = User.find_by(login_id: session_params[:login_id])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to public_reservations_top_path, notice: "ログインしました。"
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

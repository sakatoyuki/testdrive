class Public::SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(login_id: session_params[:login_id])

    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to "#", notice: "ログインしました。"
    else
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

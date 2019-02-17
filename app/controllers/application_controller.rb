class ApplicationController < ActionController::Base
  helper_method :current_dealer, :logged_in?
  #before_action :login_required

  private

  def current_dealer
    @current_dealer ||= Dealer.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !current_dealer.nil?
  end

  def login_required
    redirect_to admin_login_path unless current_dealer
  end

end

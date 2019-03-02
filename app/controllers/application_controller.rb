class ApplicationController < ActionController::Base
  helper_method :current_dealer, :dealer_logged_in?, :current_user, :user_logged_in?
  #before_action :login_user_required
  before_action :login_dealer_required

  private

  def current_dealer
    @current_dealer ||= Dealer.find_by(id: session[:dealer_id]) if session[:dealer_id]
  end

  def dealer_logged_in?
    !current_dealer.nil?
  end

  def login_dealer_required
    redirect_to admin_login_path unless current_dealer
  end


  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def user_logged_in?
    !current_user.nil?
  end

  def login_user_required
    redirect_to public_login_path unless current_user
  end

end

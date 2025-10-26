class ApplicationController < ActionController::Base
  before_action :require_login
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def require_login
    unless logged_in?
      flash[:alert] = "Not authorized"
      redirect_back_or_to root_path
    end
  end

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    unless logged_in? 
      flash[:alert] = "Not authorized"
      redirect_back_or_to root_path
    else
      User.find(session[:user_id])
    end
  end
end

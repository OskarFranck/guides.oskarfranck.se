class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:create, :login]

  def create
    @user = User.find_by(name: params[:name])

    if !!@user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:alert] = "Wrong credentials"
      redirect_to login_path
      
      #message = "Wrong credentials"
      #redirect_to login_path, notice: message
    end
  end

  def destroy
    session.clear
    flash[:info] = "Session destroyed"
    redirect_to root_path
  end

end

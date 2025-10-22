class UsersController < ApplicationController
include SessionsHelper, UsersHelper

  def index
    @users = User.where(is_creator: true)
  end

  def show
    if logged_in? && current_user[:id] && current_user[:id] == params[:id].to_i
      @user = User.find(params[:id])
    else
      flash[:alert] = "Not authorized"
      redirect_back_or_to root_path
    end
  end

  #def new
  #  @user = User.new
  #end
  
  #def create
  #  @user = User.new(user_params)
  #  if @user.save
  #    session[:user_id] = @user.id
  #    redirect_to root_path
  #  else
  #    render :new
  #  end
  #end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

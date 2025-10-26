class UsersController < ApplicationController

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

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end

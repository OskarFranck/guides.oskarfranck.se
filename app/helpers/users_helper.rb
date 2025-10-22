module UsersHelper
  def is_subscriped?
      
  end

  def number_of_active_subscriptions
    n = UserCreatorAssignment.where(user_id: session[:user_id]).length
    if n < 0
      n = 0
    end
    return n
  end
  
end

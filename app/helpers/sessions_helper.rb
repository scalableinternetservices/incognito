module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #returns current logged in user
  def current_user
    if session[:user_ud]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end

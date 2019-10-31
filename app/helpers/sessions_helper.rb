module SessionsHelper
  def log_in(user)
    session[:user_id] = user.id
  end
  
  #returns current logged in user
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    @current_user = nil
    session.delete(:user_id)
  end
end

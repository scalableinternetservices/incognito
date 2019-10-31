class UsersController < ApplicationController
  #before_action :logged_in_user, only: [:edit, :update]

  #before_action :correct_user,   only: [:edit, :update]


  def edit
    @user = User.find(params[:id])
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  def create
    
    user_params[:write] = false


    
    @user = User.new(user_params)
    
    @user[:write] = false
    if user_params[:email].length >= 8 && user_params[:email][-4..-1] == ".edu" 
      @user[:write] = true
    end
    
    if @user.save
      
     UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url


      # Handle a successful save.
    else
      render 'new'
    end
  end
  
  
  private

    def user_params
      params.require(:user).permit(:email, :username, :write, :password,
                                   :password_confirmation)
    end
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
      
        store_location

        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end    
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
end

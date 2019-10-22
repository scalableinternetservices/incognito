class UsersController < ApplicationController
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
    if user_params[:email].length >= 8 && user_params[:email][-8..-1] == "ucla.edu" 
      @user[:write] = true
    end
    
    if @user.save
      
      flash[:success] = "Welcome to the Sample App!"

      redirect_to @user

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
end

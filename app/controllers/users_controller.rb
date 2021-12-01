class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # if User.where(email: (params[:user][:email])).nil?
      new_user = User.create(user_params)
    #   redirect_to user_path(new_user.id)
    # else
    #   redirect_to new_user_path
    #   flash[:error] = 'Email already taken, please try a new email.'
    # end
    
    if new_user.save
      redirect_to user_path(new_user.id)
      flash[:notice] = 'New user created.'
    else
      redirect_to new_user_path
      flash[:error] = 'Please try again.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
  
end

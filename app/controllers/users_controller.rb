class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
   @user = User.new(user_params)
   if @user.save
    flash[:success]="Hi #{@user.username},  have successfully signed up to idora"
    redirect_to collections_path
   else
    render 'new'
   end
  end

private
  def user_params
   params.require(:user).permit(:username, :email, :password)

  end


end

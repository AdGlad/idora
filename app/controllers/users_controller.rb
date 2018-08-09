class UsersController < ApplicationController

  def show
   @user = User.find(params[:id]) 
  end
  
  def new
    @user = User.new
  end
  
  def edit
   @user = User.find(params[:id]) 
  end
  
  def update
   @user = User.find(params[:id]) 
   if @user.update(user_params)
    flash[:success]="The account #{@user.username},  have successfully updated your account"
    redirect_to collections_path
   else
    render 'new'
   end
  
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

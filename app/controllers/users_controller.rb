class UsersController < ApplicationController
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
   #@users=User.all
   @users=User.paginate(page: params[:page], per_page: 5)
  end

  def show
   @user = User.find(params[:id]) 
   @user_collections = @user.collections.paginate(page: params[:page], per_page: 5)
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
  def require_same_user
    if current_user != @user
      flash[:danger] = "You can only edit your own account"
      redirect_to user_path
    end
    
  end

end

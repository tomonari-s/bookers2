class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update] 
  
  def show
    @user = User.find(params[:id]) 
    @books = @user.books
    @book = Book.new
    @users = current_user
  end
  
  
  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if  @user.save
      redirect_to user_path(@user.id)
      flash[:notice] = "You have updated user successfully."
    else
      render :edit
    end  
  end
  
  def index 
    @user = current_user 
    @book = Book.new
    @books = @user.books.page(params[:page]) 
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  
  def correct_user
    @user = User.find(params[:id])
   if current_user != @user
    redirect_to user_path(current_user)
   end
  end

  
end

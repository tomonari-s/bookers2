class UsersController < ApplicationController
  
  
  def show
    @user = User.find(params[:id]) 
    @books = @user.books.page(params[:page])
    @book = Book.new
  end
  
  
  def edit
    @user = User.find(params[:id])
    
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if  @user.save
      redirect_to user_path(@user.id)
      flash[:notice] = "successfully"
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
end

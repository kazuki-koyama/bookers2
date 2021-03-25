class UsersController < ApplicationController
  def index
    @users = User.all
    @book = Book.new
    @book.user_id = current_user.id
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @book.user_id = @user.id
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
      redirect_to books_path(current_user.id)
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: "You have updated user successfully."
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

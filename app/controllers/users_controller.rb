class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
    @users = User.all
  end

  # def create
  #   @user = User.new(user_prams)
  #   @user.save
  # end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'You have updated your profile successfully.'
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end

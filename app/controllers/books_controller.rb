class BooksController < ApplicationController
  before_action :authenticate_user!

  def create
    @books = Book.all
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book), notice: 'You have created book successfully.'
    else
      render :index
    end

  end

  def index
    @books = Book.all
    @book = Book.new
    @book.user_id = current_user.id
    @users = User.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @book.user
    # @user = @book.user_id
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render :edit
    else
      redirect_to books_path
    end
  end

  def update
    # @user = User.find(params[:id])
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice: 'Book was successfully destroyed.'
  end

  private
  def book_params
    params.require(:book).permit(:title,:body)
  end
end

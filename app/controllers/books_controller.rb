class BooksController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user,only: [:edit, :update]
  def index
    @book = Book.new
    @book.user_id = current_user.id
    @books = Book.all
    @user = User.all

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
   else
     @books = Book.all
    render :index
   end
  end

  def show
    @book = Book.find(params[:id])
    @book_comment = BookComment.new
    @user = @book.user.id
    @newbook = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def book_params
    params.require(:book).permit(:title, :body)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
end

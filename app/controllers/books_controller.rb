class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end
  
  def create
    @book = current_user.books.new(book_params)
    @user = current_user
    if @book.save
      flash.notice = "You have created book successfully."
      redirect_to book_path(@book)
    else
      @books = Book.all
      flash.alert = "error"
      render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
      redirect_to books_path
    end
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash.notice = "You have created book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def new
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end

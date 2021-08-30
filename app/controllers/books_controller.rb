class BooksController < ApplicationController
  def index
    @books = Book.search(params[:search])
  end

  def new
    user_must_be_seller(new_book_path)
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, notice: "Book successfully created"
    else
      flash.now[:alert] = "Something went wrong"
      render 'new'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author, :price, :user_id, :available)
  end
  
end

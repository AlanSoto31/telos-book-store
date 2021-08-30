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
      redirect_to root_path, notice: 'Book successfully created'
    else
      flash.now[:alert] = 'Something went wrong'
      render 'new'
    end
  end

  def edit
    @book = find_book
  end

  def update
    @book = find_book
    if @book.update(book_params)
      redirect_to root_path, notice: 'Book was successfully updated'
    else
      flash[:alert] = 'Something went wrong'
      render 'edit'
    end
  end

  def destroy
    @book = find_book
    if @book.destroy
      redirect_to root_path, notice: 'Book was successfully deleted.'
    else
      flash[:alert] = 'Something went wrong'
    end
  end

  private

  def find_book
    Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :price, :user_id, :available)
  end
end

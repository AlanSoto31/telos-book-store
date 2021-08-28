class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def new
    user_must_be_seller(new_book_path)
  end

end

class BooksController < ApplicationController
  def new
    user_must_be_seller(new_book_path)
  end
end

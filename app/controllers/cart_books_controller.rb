class CartBooksController < ApplicationController
  before_action :user_must_be_buyer

  def create
    @current_cart = current_cart
    c_book = Book.find(params[:book_id])
    c_book.update(available: false)
    render_index_real_time
    cart_book = CartBook.new(book_id: params[:book_id], cart_id: @current_cart.id)
    cart_book.save
    redirect_to root_path
  end

  def destroy
    c_book = Book.find(params[:book_id])
    c_book.update(available: true)
    cart_book = CartBook.find(params[:id])
    cart_book.destroy
    render_index_real_time
    redirect_to cart_path(current_cart)
  end

  private

  def cart_book_params
    params.require(:cart_book).permit(:cart_id, :book_id)
  end
end

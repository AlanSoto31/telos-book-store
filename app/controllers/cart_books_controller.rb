class CartBooksController < ApplicationController
    before_action :user_must_be_buyer

    def create
        @current_cart = current_cart
        c_book = Book.find(params[:book_id])
        c_book.update(available: false)
        cart_book = CartBook.new(book_id: params[:book_id], cart_id: @current_cart.id)
        cart_book.save
        redirect_to root_path
    end

    private

    def cart_book_params
        params.require(:cart_book).permit(:cart_id, :book_id)
    end
end

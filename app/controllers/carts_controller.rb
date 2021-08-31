class CartsController < ApplicationController
  before_action :update_availability_books, only: [:destroy]

  def show
    @cart = Cart.find(params[:id])
    @total = current_total
  end

  def checkout
    user = current_user
    cart = current_cart
    total = params[:total].to_i
    check = user.balance - total
    if check.positive?
      user.update(balance: check)
      cart.books.each { |book| Sale.create(book_id: book.id, user_id: book.user_id) }
      cart.destroy
      redirect_to root_path, notice: 'Thanks for your purchase'
    else
      redirect_to cart_path(cart)
      flash[:alert] = 'Insufficient funds'
    end
  end

  def destroy
    cart = Cart.find(params[:id])
    if cart.destroy
      render_index_real_time
      redirect_to root_path, notice: 'Cart was successfully deleted'
    else
      flash[:alert] = 'Something went wrong'
      redirect_to cart_path
    end
  end
end

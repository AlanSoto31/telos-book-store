class CartsController < ApplicationController
  before_action :update_availability_books, only: [:destroy]

  def show
    @cart = Cart.find(params[:id])
  end

  def destroy
    cart = Cart.find(params[:id])
    if cart.destroy
      redirect_to root_path, notice: 'Cart was successfully deleted'
    else
      flash.now[:alert] = 'Something went wrong'
      redirect_to cart_path
    end
  end
end

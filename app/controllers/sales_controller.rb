class SalesController < ApplicationController
  def index
    @sales = current_user.books
    @earnings = Sale.earnings(@sales)
  end
end

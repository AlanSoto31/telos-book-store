class SalesController < ApplicationController
  def index
    @sales = current_user.books
    @app_revenue = 1
    @earnings = Sale.earnings(@sales)
    @net_earnings = @earnings - @app_revenue
  end
end

class SalesController < ApplicationController
  def index
    @sales = current_user.books
    @app_revenue = 1
    @earnings = Sale.earnings(@sales, @app_revenue)

    @net_earnings = @earnings[:earnings] > 0 ? @earnings[:earnings] - @earnings[:app_fee] : @earnings[:earnings]
  end
end

class SalesController < ApplicationController
  def index
    @sales = current_user.books
    app_revenue = 1
    @results = Sale.earnings(@sales, app_revenue)
    @net_earnings = (@results[:earnings]).positive? ? @results[:earnings] - @results[:app_fee] : @earnings[:earnings]
  end
end

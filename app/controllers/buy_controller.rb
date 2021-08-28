class BuyController < ApplicationController
  def new
    user_must_be_buyer(new_buy_path)
  end
end

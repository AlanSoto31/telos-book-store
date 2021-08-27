class HomeController < ApplicationController
  def index
    @cu = current_user
  end
end

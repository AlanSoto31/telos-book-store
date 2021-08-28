class BooksController < ApplicationController
  before_action :user_must_be_seller
  def new
  end
end

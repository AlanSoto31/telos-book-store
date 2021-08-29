class Book < ApplicationRecord
  belongs_to :user
  has_many :cart_books, dependent: :delete_all
  has_many :carts, through: :cart_books

  def self.search(search)
    Book.find_by(title: search) ? Book.where(title: search) : Book.all
  end
end

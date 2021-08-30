class Cart < ApplicationRecord
  belongs_to :user
  has_many :cart_books, dependent: :delete_all
  has_many :books, through: :cart_books


  def self.total(cart)
    acc = 0
    cart.cart_books.each do |cb|
      acc += cb.qty * cb.book.price
    end
    acc
  end
end

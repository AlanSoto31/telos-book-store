class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :book

  def self.earnings(sales)
    acc = 0
    sales.each do |book|
      acc += book.price
    end
    acc
  end
end

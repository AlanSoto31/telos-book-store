class Book < ApplicationRecord
  belongs_to :user

  def self.search(search)
      Book.find_by(title: search) ? Book.where(title: search) : Book.all
  end

end

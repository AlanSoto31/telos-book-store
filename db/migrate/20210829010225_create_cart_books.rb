class CreateCartBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_books do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true
      t.integer :qty

      t.timestamps
    end
  end
end

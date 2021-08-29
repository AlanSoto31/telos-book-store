class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.string :author
      t.decimal :price
      t.references :user, null: false, foreign_key: true
      t.boolean :available, default: true

      t.timestamps
    end
  end
end

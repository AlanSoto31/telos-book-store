class CreateNames < ActiveRecord::Migration[6.1]
  def change
    create_table :names do |t|
      t.string :email
      t.string :address
      t.string :phone
      t.string :password_digest
      t.decimal :balance, default: 50.00
      t.boolean :seller, default: false

      t.timestamps
    end
  end
end

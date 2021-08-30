# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_30_035316) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "author"
    t.decimal "price"
    t.bigint "user_id", null: false
    t.boolean "available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "cart_books", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "book_id", null: false
    t.integer "qty", default: 1
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_cart_books_on_book_id"
    t.index ["cart_id"], name: "index_cart_books_on_cart_id"
  end

  create_table "carts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_sales_on_book_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "address"
    t.string "phone"
    t.string "password_digest"
    t.decimal "balance", default: "50.0"
    t.boolean "seller", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "books", "users"
  add_foreign_key "cart_books", "books"
  add_foreign_key "cart_books", "carts"
  add_foreign_key "carts", "users"
  add_foreign_key "sales", "books"
  add_foreign_key "sales", "users"
end

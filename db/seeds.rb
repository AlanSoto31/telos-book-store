# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(name: 'alan', email: 'alan@alan', address: 'acambaro', phone: '123456', password: '123456', seller: true)
user2 = User.create(name: 'ana', email: 'ana@ana', address: 'acambaro', phone: '123456', password: '123456', seller: true)
user3 = User.create(name: 'hana', email: 'hana@hana', address: 'acambaro', phone: '123456', password: '123456', seller: true)

(1..3).each do
    Book.create({
        title: Faker::Book.title,
        description: "Description",
        author: Faker::Book.author,
        price: 15.00,
        user_id: user1.id,
    })
end

(1..3).each do
    Book.create({
        title: Faker::Book.title,
        description: "Description",
        author: Faker::Book.author,
        price: 15.00,
        user_id: user2.id,
    })
end

(1..4).each do
    Book.create({
        title: Faker::Book.title,
        description: "Description",
        author: Faker::Book.author,
        price: 15.00,
        user_id: user3.id,
    })
end


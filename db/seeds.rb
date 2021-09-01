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

p "Created #{User.count} users"

Book.create(title: 'Poema de Gilgamesh', description: 'description b1' author: 'Anónimo', price: 15.00, seller: user1.id)
Book.create(title: 'Todo se desmorona', description: 'description b2' author: 'Chinua Achebe', price: 15.00, seller: user2.id)
Book.create(title: 'Divina comedia', description: 'description b3' author: 'Dante Alighieri', price: 15.00, seller: user3.id)
Book.create(title: 'Orgullo y prejuicio', description: 'description b4' author: 'Jane Austen', price: 15.00, seller: user1.id)
Book.create(title: 'Decamerón', description: 'description b5' author: 'Giovanni Boccaccio', price: 15.00, seller: user2.id)
Book.create(title: 'Ficciones', description: 'description b6' author: 'Jorge Luis Borges', price: 15.00, seller: user3.id)
Book.create(title: 'Cumbres Borrascosas', description: 'description b7' author: 'Emily Brontë', price: 15.00, seller: user1.id)
Book.create(title: 'Don Quijote de la Mancha', description: 'description b8' author: 'Miguel de Cervantes', price: 15.00, seller: user2.id)
Book.create(title: 'Grandes Esperanzas', description: 'description b9' author: 'Charles Dickens', price: 15.00, seller: user3.id)
Book.create(title: 'Crimen y castigo', description: 'description b10' author: 'Fiódor Dostoievski', price: 15.00, seller: user1.id)

p "Created #{Book.count} books"
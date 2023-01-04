# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user_fey = User.create(
  email: 'fey@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  role: "admin",
  approved: true,
)

user_fey.skip_confirmation!
user_fey.save

admin = User.create(
  email: 'admin@admin.com',
  password: '123456',
  password_confirmation: '123456',
  role: "admin",
  approved: true,
)

admin.skip_confirmation!
admin.save
user1 = User.create(
  email: 'user1@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  role: "trader",
  approved: true,
)

user1.skip_confirmation!
user1.save

user2 = User.create(
  email: 'user2@gmail.com',
  password: '123456',
  password_confirmation: '123456',
  role: "trader",
  approved: false,
)

user2.skip_confirmation!
user2.save
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unit_hr = Unit.create(name: 'HR')
unit_it = Unit.create(name: 'IT')

User.create(full_name: 'User 1', email: 'user-1@example.com', unit: unit_hr)
User.create(full_name: 'User 2', email: 'user-2@example.com', unit: unit_it)
User.create(full_name: 'User 3', email: 'user-3@example.com', unit: unit_it)

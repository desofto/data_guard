# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unit_hr = Unit.create(name: 'HR')
unit_it = Unit.create(name: 'IT')

users = [
  User.create(full_name: 'User 1', email: 'user-1@example.com', unit: unit_hr),
  User.create(full_name: 'User 2', email: 'user-2@example.com', unit: unit_it),
  User.create(full_name: 'User 3', email: 'user-3@example.com', unit: unit_hr),
  User.create(full_name: 'User 4', email: 'user-4@example.com', unit: unit_it),
  User.create(full_name: 'User 5', email: 'user-5@example.com', unit: unit_hr),
  User.create(full_name: 'User 6', email: 'user-6@example.com', unit: unit_it)
]

event = Event.create
Group.create(event: event, leader: users[0], users: [users[0], users[1], users[2]])
Group.create(event: event, leader: users[3], users: [users[3], users[4], users[5]])

event = Event.create
Group.create(event: event, leader: users[2], users: [users[0], users[3], users[2]])
Group.create(event: event, leader: users[1], users: [users[1], users[4], users[5]])

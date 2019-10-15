# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Organization.create(name: "Snack Shack", hourly_rate: 10.00)
Organization.create(name: "Doggie Diner", hourly_rate: 11.25)
Organization.create(name: "Burger Castle", hourly_rate: 8.75)

User.create(name: "dillon", email: "dillon@dillon.com", password: "password", organization_id: 1)
User.create(name: "carl", email: "carl@carl.com", password: "password", organization_id: 1)
User.create(name: "tito", email: "tito@tito.com", password: "password", organization_id: 2)
User.create(name: "maggie", email: "maggie@maggie.com", password: "password", organization_id: 2)
User.create(name: "tom", email: "tom@tom.com", password: "password", organization_id: 3)

Shift.create(start: "2019-10-15 12:26:51", finish: "2019-10-15 18:44:51", user_id: 1, break: 30)
Shift.create(start: "2019-10-15 14:26:51", finish: "2019-10-15 19:24:51", user_id: 2, break: 15)
Shift.create(start: "2019-10-14 12:26:51", finish: "2019-10-14 18:26:51", user_id: 3)
Shift.create(start: "2019-10-12 11:26:51", finish: "2019-10-12 18:26:51", user_id: 4)
Shift.create(start: "2019-10-12 12:26:51", finish: "2019-10-12 20:24:51", user_id: 5, break: 30)
Shift.create(start: "2019-10-10 10:26:51", finish: "2019-10-10 18:26:51", user_id: 1)
Shift.create(start: "2019-10-11 13:26:51", finish: "2019-10-11 22:26:51", user_id: 4, break: 30)
Shift.create(start: "2019-10-11 11:26:51", finish: "2019-10-11 20:16:51", user_id: 3)
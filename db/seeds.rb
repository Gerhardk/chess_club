# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: "admin+chessclub@example.com", password: "chessclub")

Member.create(name: "Player", surname: "One", email:"playerone@example.com", birthday: (30.years + 1.years).ago)
Member.create(name: "Player", surname: "Two", email:"playertwo@example.com", birthday: (30.years + 2.years).ago)
Member.create(name: "Player", surname: "Three", email:"playerthree@example.com", birthday: (30.years + 3.years).ago)
Member.create(name: "Player", surname: "Four", email:"playerfour@example.com", birthday: (30.years + 4.years).ago)
Member.create(name: "Player", surname: "Five", email:"playerfive@example.com", birthday: (30.years + 5.years).ago)
Member.create(name: "Player", surname: "Six", email:"playersix@example.com", birthday: (30.years + 6.years).ago)
Member.create(name: "Player", surname: "Seven", email:"playerseven@example.com", birthday: (30.years + 7.years).ago)
Member.create(name: "Player", surname: "Eight", email:"playereight@example.com", birthday: (30.years + 8.years).ago)
Member.create(name: "Player", surname: "Nine", email:"playernine@example.com", birthday: (30.years + 9.years).ago)
Member.create(name: "Player", surname: "Ten", email:"playerten@example.com", birthday: (30.years + 1.years).ago)
Member.create(name: "Player", surname: "Eleven", email:"playereleven@example.com", birthday: (30.years + 2.years).ago)
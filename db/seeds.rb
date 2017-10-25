# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Friend.create(user1: 1, user2: 2)
Friend.create(user1: 1, user2: 3)
Friend.create(user1: 1, user2: 4)

Mail.create(subject: "abcefd", content: "ewakwaekjnr")
Mail.create(subject: "abcefd", content: "ewakwaekjnr")
Mail.create(subject: "abcefd", content: "ewakwaekjnr")
Mail.create(subject: "abcefd", content: "ewakwaekjnr")

Usermail.create(from: 1, to: 3, mail_id: 1, status: "read", read_at: "2017-10-22 05:56:25")
Usermail.create(from: 1, to: 2, mail_id: 2, status: "read", read_at: "2017-10-22 05:56:25")
Usermail.create(from: 1, to: 2, mail_id: 4, status: "received")
Usermail.create(from: 2, to: 1, mail_id: 1, status: "read", read_at: "2017-10-22 05:56:25")
Usermail.create(from: 3, to: 1, mail_id: 3, status: "read", read_at: "2017-10-22 05:56:25")
Usermail.create(from: 2, to: 3, mail_id: 1, status: "read", read_at: "2017-10-22 05:56:25")

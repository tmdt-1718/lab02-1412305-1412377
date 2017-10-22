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

  
Mail.create(id: 1, subject: "abcefd", content: "ewakwaekjnr")
Mail.create(id: 2, subject: "abcefd", content: "ewakwaekjnr")
Mail.create(id: 3, subject: "abcefd", content: "ewakwaekjnr")
Mail.create(id: 4, subject: "abcefd", content: "ewakwaekjnr")
Usermail.create(user_id: 1, mail_id:1, status: "sent")
Usermail.create(user_id: 2, mail_id:2, status: "read")
Usermail.create(user_id: 1, mail_id:3, status: "received")
Usermail.create(user_id: 1, mail_id:1, status: "sent")
Usermail.create(user_id: 1, mail_id:3, status: "sent")
Usermail.create(user_id: 2, mail_id:4, status: "sent")
Usermail.create(user_id: 2, mail_id:1, status: "sent")

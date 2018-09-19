kim = User.create(name: "Kim", title: "Volunteer", email: "kim@kim.com", password: "kimk", password_confirmation: "kimk")
natalie = User.create(name: "Natalie", title: "Case Worker", email: "natalie@natalie.com", password: "natalien", password_confirmation: "natalien")

janet = Beneficiary.create(name: "Janet", gender: "F", id_number: 5123456)
bill = Beneficiary.create(name: "Bill", gender: "M", id_number: 5987654)

kim.beneficiaries << janet
natalie.beneficiaries << bill

one = Update.create(user_id: 1, beneficiary_id: 1, notes: "Received id card", date: DateTime.new(2017, 5, 5))
two = Update.create(user_id: 1, beneficiary_id: 1, notes: "Appointment at hospital", date: DateTime.new(2017, 6, 6))
three = Update.create(user_id: 2, beneficiary_id: 1, notes: "Language lesson", date: DateTime.new(2017, 7, 7))
four = Update.create(user_id: 2, beneficiary_id: 1, notes: "Checked in to shelter", date: DateTime.new(2018, 6, 6))
five = Update.create(user_id: 2, beneficiary_id: 1, notes: "Received coupons", date: DateTime.new(2018, 9, 6))

six = Update.create(user_id: 2, beneficiary_id: 2, notes: "Made complaint about employer", date: DateTime.new(2018, 5, 6))

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

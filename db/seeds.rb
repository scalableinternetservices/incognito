# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create( email: "blah@ucla.edu", username:"bleh",write:true, university_acronym: "ucla", university: "University of California, Los Angeles", password: "123456", password_confirmation:"123456")
User.create( email: "blah@usc.edu", username:"bleh2",write:true, university_acronym: "usc", university: "University of Southern California", password: "123456", password_confirmation:"123456")
User.create( email: "blah@berkeley.edu", username:"bleh3",write:true, university_acronym: "berkeley", university: "University of California, Berkeley", password: "123456", password_confirmation:"123456")

Post.create!(title:  "That Eggert Midterm was EASY",
             body: "ggwp that was ezpz",
             user_id: 1,
             university: "ucla",
             public: false)
             
Post.create!(title:  "Man UCLA Sucks",
             body: "Go Trojans",
             user_id: 2,
             university: "usc",
             public: true)
             
 Post.create!(title:  "It's so sad here in Berkeley :(",
             body: "^",
             user_id: 3,
             university: "berkeley",
             public: true)
             
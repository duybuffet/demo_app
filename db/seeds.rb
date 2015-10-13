# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: "Tang Hoai Duy", 
			email: "duyth1993@gmail.com", 
			password: "123456", 
			password_confirmation: "123456",
			admin: true)

99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@railstutorial.org"
  	password = "password"
  	User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
	content = Faker::Lorem.sentence(5)
	title = Faker::Name.name[0..15]
	users.each {|user| user.entries.create!(content: content, title: title)}
end

entry = Entry.first
u = User.first
50.times do
	content = Faker::Lorem.sentence(5)
	comment = entry.comments.build(content: content)
	comment.user_id = u.id
	comment.save
end

# Following relationships
users = User.all
user  = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }

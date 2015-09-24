require "faker"

Group.destroy_all
Membership.destroy_all
User.destroy_all

group = Group.create(name: Faker::Company.name)
puts "created a group"

user = User.create(name: "User", email: "user@example.com", password: "password")
group.users << user
puts "created generic user account"

6.times { group.users << User.create(name: Faker::Name.name, email: Faker::Internet.email, password: "password") }
puts "generated six memberships for group"
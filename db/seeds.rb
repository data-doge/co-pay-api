require 'faker'

6.times { User.create(name: Faker::Name.name, email: Faker::Internet.email, password: 'password') }
puts "generated six users"


require "faker"

Group.destroy_all
Membership.destroy_all
User.destroy_all

group = Group.create(name: 'Hausey Haus')
puts "created group"

users = [
  {
    name: 'Alice Pope',
    email: 'alice.emily.pope@gmail.com'
  },
  {
    name: 'Eugene Lynch',
    email: 'eugene@enspiral.com'
  },
  {
    name: 'Lilah Gonen',
    email: 'lilah.gonen@gmail.com'
  },
  {
    name: 'Mariah Muller',
    email: 'mariahmuller92@gmail.com'
  },
  {
    name: 'Pristine Shin',
    email: 'prisvsyo@gmail.com'
  }
]

users.each { |user| group.users << User.create(name: user[:name], email: user[:email], password: "password") }
puts "generated memberships for group"
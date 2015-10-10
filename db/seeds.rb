require "faker"

Group.destroy_all
Membership.destroy_all
User.destroy_all
Purchase.destroy_all

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

6.times do 
  purchase = Purchase.create(description: Faker::Lorem.sentence, details: Faker::Lorem.paragraph, amount: rand(1.0..100.0), group: group, user: group.users.sample)
  indiv_amount = purchase.amount / group.users.length
  group.users.select { |user| user.id != purchase.user.id }.each do |user|
    purchase.payments.create(user: user, amount: indiv_amount)
  end
end

puts "purchases created"
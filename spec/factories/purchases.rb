FactoryGirl.define do
  factory :purchase do
    description {Faker::Lorem.sentence}
    details {Faker::Lorem.paragraph}
    amount {rand(1.0..100.0)}
    user
    group
  end
end

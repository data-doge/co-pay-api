FactoryGirl.define do
  factory :group do
    name {Faker::Company.name}
  end
end

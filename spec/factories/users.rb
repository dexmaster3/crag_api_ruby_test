FactoryGirl.define do
  factory :user do
    name { Faker::Name.name}
    email 'test.email@rag.com'
    password 'mytestpass'
  end
end
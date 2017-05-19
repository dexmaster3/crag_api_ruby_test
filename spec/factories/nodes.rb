FactoryGirl.define do
  factory :node do
    xcoord { Faker::Number.number(5) }
    ycoord { Faker::Number.number(5) }
    weight { Faker::Number.number(2) }
    crag_id nil
    end
end
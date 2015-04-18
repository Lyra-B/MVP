FactoryGirl.define do
  factory :coach do
    firstname "James"
    lastname "Brown"
    email "james@mail.com"
    password "password"
    type "Coach"
  end
end
FactoryGirl.define do
  factory :administrator do
    firstname "Derek"
    lastname "Brown"
    email "derek@mail.com"
    password "password"
    type "Administrator"
  end
end
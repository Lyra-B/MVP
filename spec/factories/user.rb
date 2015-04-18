FactoryGirl.define do
  factory :user do
    factory :coach do
      firstname "James"
      lastname "Brown"
      email "james@mail.com"
      password "password"
      type "Coach"
    end

    factory :administrator do
      firstname "Derek"
      lastname "Brown"
      email "derek@mail.com"
      password "password"
      type "Administrator"
    end
  end
end
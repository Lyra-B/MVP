FactoryGirl.define do
  factory :user do
    factory :coach do
      email "james@mail.com"
      password "password"
      type "coach"
    end

    factory :administrator do
      email "derek@mail.com"
      password "password"
      type "administrator"
    end
  end
end
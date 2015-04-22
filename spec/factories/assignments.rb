FactoryGirl.define do
  factory :assignment do
    coach_id 1
    administrator_id 1
    session_id 1
    status "waiting"
  end
end

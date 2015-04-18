Given(/^there are some coaches$/) do
  @coach_1 = FactoryGirl.create(:coach, email: "james_2@mail.com")
  @coach_2 = FactoryGirl.create(:coach, firstname: "Bob", lastname: "Harris", email: "bob@mail.com")
  @coach_3 = FactoryGirl.create(:coach, firstname: "Harry", lastname: "Powell", email: "harry@mail.com")
end

Given(/^there are some sessions$/) do
  5.times{ FactoryGirl.create(:session) }
end

Then(/^I see a list of coaches$/) do
  expect(page.has_content?(@coach_1.firstname)).to be_truthy
  expect(page.has_content?(@coach_2.firstname)).to be_truthy
  expect(page.has_content?(@coach_3.firstname)).to be_truthy
  expect(page.has_content?(@coach_1.lastname)).to be_truthy
  expect(page.has_content?(@coach_2.lastname)).to be_truthy
  expect(page.has_content?(@coach_3.lastname)).to be_truthy
end
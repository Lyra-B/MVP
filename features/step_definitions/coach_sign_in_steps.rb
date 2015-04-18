Given(/^there are some coaches$/) do
  @coach = FactoryGirl.create(:coach)
end

When(/^I enter my details as a coach$/) do
  fill_in "Email", :with => "james@mail.com"
  fill_in "Password", :with => "password"
end

Then(/^I see my coach dashboard$/) do
  expect(page.has_content?(@coach.firstname)).to be_truthy
end
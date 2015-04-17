Given(/^there are some coaches$/) do
  @coach = Coach.create(:email => "james@mail.com", :password => "password")
end

Given(/^I am in the homepage$/) do
  visit '/'
end

Given(/^I sign in$/) do
  click_on "Sign in"
end

When(/^I enter my details$/) do
  fill_in "Email", :with => "derek@mail.com"
  fill_in "Password", :with => "password"
end

When(/^I submit$/) do
  click_on "Log in"
end

Then(/^I see my profile page$/) do
  expect(page.has_content(@administrator.firstname)).to be true
end

Then(/^I see a calendar with my sessions$/) do
  expect(page.has_content(@session.title)).to be true
end
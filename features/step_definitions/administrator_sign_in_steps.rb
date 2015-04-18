Given(/^there are some administrators$/) do
  @administrator = FactoryGirl.create(:administrator)
end

Given(/^I am in the homepage$/) do
  visit root_url
end

Given(/^I sign in$/) do
  click_on "Sign in"
end

When(/^I enter my details as an administrator$/) do
  fill_in "Email", :with => "derek@mail.com"
  fill_in "Password", :with => "password"
end

When(/^I submit$/) do
 click_on "Log in"
end

Then(/^I see my administrator dashboard$/) do
  expect(page.has_content?(@administrator.firstname)).to be_truthy
end
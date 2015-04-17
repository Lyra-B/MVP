# Given(/^I am in the homepage$/) do
#   visit '/'
# end

# Given(/^I sign up$/) do
#   click_on "Sign up"
# end

# When(/^I enter my details$/) do
#   fill_in "Email", :with => "derek@gmail.com"
#   fill_in "Password", :with => "password"
# end

# When(/^I select "(.*?)" as a type$/) do |type|
#   select("Administrator", :from => "Type")
# end

# When(/^I submit$/) do
#   click_button "Sign up"
# end

# Then(/^I am signed in as a "(.*?)"$/) do |type|
#   expect(User.count).to eq 1
#   expect(Administrator.count).to eq 1
# end

# Then(/^I see the administration page with a calendar$/) do
#   expect(page.has_content("Month")).to be true
# end
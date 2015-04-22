# Given(/^I have some notifications$/) do
#   @coach = Coach.first
#   @session_1 = FactoryGirl.create(:session, :title => "Cricket")
#   @session_2 = FactoryGirl.create(:session, :title => "Baseball")
#   @assignment_1 = FactoryGirl.create(:assignment, coach_id: @coach.id, session_id:@session_1.id)
#   @assignment_2 = FactoryGirl.create(:assignment, coach_id: @coach.id, session_id:@session_2.id)
#   @coach.assignments << @assignment_1
#   @coach.assignments << @assignment_2
#   @coach.save
# end

# When(/^I select accept on "(.*?)"$/) do |assignment|
#   save_and_open_page
#   within(assignment) do
#     click_on "Accept"
#   end
# end

# Then(/^the status of this assignment becomes accepted$/) do
#   expect(assignment_1.status).to eq("accepted")
# end

# When(/^I select decline on "(.*?)"$/) do |assignment|
#   within(assignment) do
#     click_on "Decline"
#   end
# end

# Then(/^the status of this assignment becomes declined$/) do
#   expect(assignment_1.status).to eq("declined")
# end
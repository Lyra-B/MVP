require 'rails_helper'

RSpec.describe User, type: :model do
  describe("coach availability") do
    before do
      @coach = Coach.create!(email:"james@mail.com", password:"password")
      @cricket = Session.create!(title:"Cricket I", description: "Introductory Cricket Course", starttime: "Sun, 19 Apr 2015 08:15:00 UTC +00:00", endtime: "Sun, 19 Apr 2015 09:15:00 UTC +00:00", coach_id: @coach.id)
      @baseball = Session.create!(title:"Baseball", description: "Introductory Baseball Course", starttime: "Sun, 19 Apr 2015 10:10:00 UTC +00:00", endtime: "Sun, 19 Apr 2015 11:00:00 UTC +00:00")
      @basketball = Session.create!(title:"Basketball", description: "Introductory Basketball Course", starttime: "Sun, 19 Apr 2015 08:20:00 UTC +00:00", endtime: "Sun, 19 Apr 2015 09:10:00 UTC +00:00")
      @volleyball = Session.create!(title:"Volleyball", description: "Advanced Volleyball", starttime: "Sun, 19 Apr 2015 08:05:00 UTC +00:00", endtime: "Sun, 19 Apr 2015 09:20:00 UTC +00:00")
    end

    it "should show if a coach is available or not in a given date range" do
      expect(@coach.availability(@baseball)).to be true
      expect(@coach.availability(@basketball)).to be false
      expect(@coach.availability(@volleyball)).to be false
    end
  end
end
require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context "Coach" do
    before do
      @coach = Coach.create(email:"james@mail.com", password:"password")
      @session = Session.create(title: "Cricket I", description: "Intro to Cricket", starttime: "Sun, 19 Apr 2015 08:15:00 UTC +00:00", endtime: "Sun, 19 Apr 2015 09:15:00 UTC +00:00", coach_id: @coach.id)
    end
    describe "#get_sessions" do

    end
  end
end

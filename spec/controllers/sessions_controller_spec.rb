require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  context "Coach" do
    login_coach

    before do
      @coach = Coach.first
    end

    describe "Post to create" do
      before do
        params = {
          session: {
            title: "Cricket I",
            description: "Intro to Cricket",
            starttime:"Sun, 19 Apr 2015 08:15:00 UTC +00:00",
            endtime:"Sun, 19 Apr 2015 10:15:00 UTC +00:00",
            period: "Does not repeat",
          }
        }
        post :create, params
      end

      it("should save the session") do
        expect(Session.count).to eq(1)
      end

      it("should have a coach id") do
        expect(Session.last.coach_id).to eq(@coach.id)
      end
    end

    describe "Get to get_sessions" do
      before do

        params = {
          :start => "1428793200",
          :end => "1429398000"
        }
        @session = FactoryGirl.create(:session, starttime: "2015-04-12 00:00:00", endtime: "2015-04-19 00:00:00", coach_id: @coach.id)
        get :get_sessions, params
      end

      it "should respond with 200" do
        expect(response.status).to eq(200)
      end

      it "assigns @sessions" do
        expect(assigns(:sessions)).to eq([@session])
      end

      it "should have coach id" do
        expect(assigns[:sessions].first.coach_id).to eq(@coach.id)
      end
    end
  end

  context "Administrator" do
    login_administrator

    before do
      @administrator = Administrator.first
    end

    describe "Post to create" do
      before do
        params = {
          session: {
            title: "Baseball",
            description: "Baseball games",
            starttime:"Sun, 19 Apr 2015 08:15:00 UTC +00:00",
            endtime:"Sun, 19 Apr 2015 10:15:00 UTC +00:00",
            period: "Does not repeat",
          }
        }
        post :create, params
      end

      it("should save the session") do
        expect(Session.count).to eq(1)
      end

      it("should have an administrator id") do
        expect(Session.last.administrator_id).to eq(@administrator.id)
      end
    end

    describe "Get to get_sessions" do
      before do
        params = {
          :start => "1428793200",
          :end => "1429398000"
        }
        @session_2 = FactoryGirl.create(:session, starttime: "2015-04-12 00:00:00", endtime: "2015-04-19 00:00:00", administrator_id: @administrator.id)
        get :get_sessions, params
      end

      it "should respond with 200" do
        expect(response.status).to eq(200)
      end

      it "assigns @sessions" do
        expect(assigns(:sessions)).to eq([@session_2])
      end

      it "should have an administrator id" do
        expect(assigns[:sessions].first.administrator_id).to eq(@administrator.id)
      end
    end
  end
end

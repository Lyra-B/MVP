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

    describe "#Assign_coach" do
      before do
        @coach = FactoryGirl.create(:coach)
        @session_1 = FactoryGirl.create(:session, starttime: "Sun, 19 Apr 2015 08:15:00 UTC +00:00", endtime: "Sun, 19 Apr 2015 09:15:00 UTC +00:00", coach_id: @coach.id)
        @session_2 = FactoryGirl.create(:session, title:"Baseball", starttime: "Sun, 19 Apr 2015 10:10:00 UTC +00:00", endtime: "Sun, 19 Apr 2015 11:00:00 UTC +00:00")
        @session_3 = FactoryGirl.create(:session, title:"Basketball", starttime: "Sun, 19 Apr 2015 08:20:00 UTC +00:00", endtime: "Sun, 19 Apr 2015 09:10:00 UTC +00:00")
      end
      describe "assign available coach to session" do
        before do
          params = {
            id: @session_2.id,
            coach_id: @coach.id
          }
          put :assign_coach, params
        end

        it "should respond with 200" do
          expect(response.status).to eq(200)
        end

        it "should add coach_id" do
          expect(assigns(:session).coach_id).to eq(@coach.id)
        end

        it "should send an invite" do
          expect(@session_2.assignments.count).to eq(1)
          expect(@coach.assignments.count).to eq(1)
          expect(@session_2.assignments.first.status).to eq("waiting")
          expect(@coach.assignments.first.status).to eq("waiting")
        end
      end

      describe "not assign unavailable coach to session" do
        before do
          params = {
            id:@session_3.id,
            coach_id: @coach.id
          }
          put :assign_coach, params
        end

        it "should respond with 200" do
          expect(response.status).to eq(200)
        end

        it "should be unable to add coach_id" do
          expect(assigns(:session).coach_id).not_to eql @coach.id
        end

        it "should not send an invite" do
          expect(@session_3.assignments.count).to eq(0)
          expect(@coach.assignments.count).to eq(0)
        end
      end

    end
  end
end

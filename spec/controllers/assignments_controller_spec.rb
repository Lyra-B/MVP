require 'rails_helper'

RSpec.describe AssignmentsController, type: :controller do
  context "Coach" do
    login_coach

    before do
      @coach = Coach.first
    end

    describe "Put to accept" do
      before do
        @assignment = FactoryGirl.create(:assignment, :coach_id => @coach.id)
        params = {
          id: @assignment.id
        }
        put :accept_session, params
      end

      it "should give a 200 response" do
        expect(response.status).to eq(200)
      end

      it "should update the status to accepted" do
        expect(assigns(:assignment).status).to eq "accepted"
      end
    end

    describe "Put to decline" do
      before do
        @assignment = FactoryGirl.create(:assignment, :coach_id => @coach.id)
        params = {
          id: @assignment.id
        }
        put :decline_session, params
      end

      it "should give a 200 response" do
        expect(response.status).to eq(200)
      end

      it "should update the status to accepted" do
        expect(assigns(:assignment).status).to eq "declined"
      end
    end
  end
end

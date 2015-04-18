require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  context "Administrator" do
    login_administrator

    describe "#show" do
      before do
        @coach_1 = FactoryGirl.create(:coach, email: "james_2@mail.com")
        @coach_2 = FactoryGirl.create(:coach, firstname: "Bob", lastname: "Harris", email: "bob@mail.com")
        @coach_3 = FactoryGirl.create(:coach, firstname: "Harry", lastname: "Powell", email: "harry@mail.com")
        get :show
      end

      it "should respond with 200" do
        expect(response).to have_http_status(200)
      end

      it "assigns @coaches" do
        expect(assigns(:coaches)).to eq ([@coach_1, @coach_2, @coach_3])
      end
    end
  end
end
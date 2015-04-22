class DashboardsController < ApplicationController
  def show
    @coaches = Coach.all
    @assignments = current_user.assignments
  end
end
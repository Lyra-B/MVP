class DashboardsController < ApplicationController
  def show
    @coaches = Coach.all
  end
end
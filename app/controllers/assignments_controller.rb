class AssignmentsController < ApplicationController
  def accept_session
    @assignment = Assignment.find(params[:id])
    @assignment.update(:status => "accepted")
    render :nothing => true
  end

  def decline_session
    @assignment = Assignment.find(params[:id])
    @assignment.update(:status => "declined")
    render :nothing => true
  end
end

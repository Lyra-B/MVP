class AssignmentsController < ApplicationController
  def accept_session
    @assignment = Assignment.find(params[:id])
    @assignment.update(:status => "accepted")
    render :nothing => true
  end

  def decline_session
    @assignment = Assignment.find(params[:id])
    @session = Session.find(@assignment.session_id)
    @assignment.update(:status => "declined")
    @session.update(:coach_id => nil)
    render :nothing => true
  end
end

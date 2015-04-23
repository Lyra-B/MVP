class SessionsController < FullcalendarEngine::SessionsController

  before_filter :authorize_admin, only: :assign_coach

  def get_sessions
    start_time = Time.at(params[:start].to_i).to_formatted_s(:db)
    end_time   = Time.at(params[:end].to_i).to_formatted_s(:db)

    if user_signed_in?
      if current_user.type == "Coach"
        @sessions = all_sessions(start_time, end_time).where(coach_id: current_user.id)
      elsif current_user.type == "Administrator"
        @sessions = all_sessions(start_time, end_time).where(administrator_id: current_user.id)
      end
    end

    sessions = []
    @sessions.each do |session|
      sessions << { id: session.id,
                    title: session.title,
                    description: session.description || '',
                    coach: session.coach_name ,
                    coachId: session.coach_id,
                    color: session.color_state,
                    start: session.starttime.iso8601,
                    end: session.endtime.iso8601,
                    allDay: session.all_day,
                    recurring: (session.session_series_id) ? true : false }

    end

    render :json => sessions.to_json
  end

  def assign_coach
    @session = Session.find(params[:id])
    @coach = Coach.find(params[:coach_id])
    if available?
      render :json => available?
      @session.update_attributes(:coach_id => @coach.id)
      @session.send_invite
    else
      render :json => available?
    end
  end

  protected
  def determine_session_type
    if params[:session][:period] == "Does not repeat"
      @session = Session.new(session_params)
      if user_signed_in?
        if current_user.type == "Coach"
          @session.coach_id = current_user.id
        elsif current_user.type == "Administrator"
          @session.administrator_id = current_user.id
        end
      end
    else
      @session = SessionSeries.new(session_params)
    end
  end

  def session_params
    params.require(:session).permit('title', 'description', 'starttime', 'endtime', 'all_day', 'period', 'frequency', 'commit_button', 'coach_id', 'administrator_id')
  end

  def available?
    @coach.availability(@session)
  end

  def authorize_admin
    redirect_to request.url if !current_user.administrator?
  end

  def all_sessions(start_time, end_time)
    Session.where('
      (starttime >= :start_time and endtime <= :end_time) or
      (starttime >= :start_time and endtime > :end_time and starttime <= :end_time) or
      (starttime <= :start_time and endtime >= :start_time and endtime <= :end_time) or
      (starttime <= :start_time and endtime > :end_time)',
      start_time: start_time, end_time: end_time)
  end
end
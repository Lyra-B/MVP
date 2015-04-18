class SessionsController < FullcalendarEngine::SessionsController
  def get_sessions
    start_time = Time.at(params[:start].to_i).to_formatted_s(:db)
    end_time   = Time.at(params[:end].to_i).to_formatted_s(:db)
    @sessions = Session.where('
                (starttime >= :start_time and endtime <= :end_time) or
                (starttime >= :start_time and endtime > :end_time and starttime <= :end_time) or
                (starttime <= :start_time and endtime >= :start_time and endtime <= :end_time) or
                (starttime <= :start_time and endtime > :end_time)',
                start_time: start_time, end_time: end_time)

    if user_signed_in?
      if current_user.type == "Coach"
        @sessions = @sessions.where(coach_id: current_user.id)
      elsif current_user.type == "Administrator"
        @sessions = @sessions.where(administrator_id: current_user.id)
      end
    end
    sessions = []
    @sessions.each do |session|
    sessions << { id: session.id,
                  title: session.title,
                  description: session.description || '',
                  start: session.starttime.iso8601,
                  end: session.endtime.iso8601,
                  allDay: session.all_day,
                  recurring: (session.session_series_id) ? true : false }
    end
    render :json => sessions.to_json
  end

  private
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
end
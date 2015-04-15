# This migration comes from fullcalendar_engine (originally 20150415212719)
class AddSessionSeriesIdToFullcalendarEngineSessions < ActiveRecord::Migration
  def change
    add_column :fullcalendar_engine_sessions, :session_series_id, :integer
  end
end

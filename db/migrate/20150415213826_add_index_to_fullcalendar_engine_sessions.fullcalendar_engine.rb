# This migration comes from fullcalendar_engine (originally 20150415213653)
class AddIndexToFullcalendarEngineSessions < ActiveRecord::Migration
  def change
    add_index :fullcalendar_engine_sessions, :session_series_id
  end
end

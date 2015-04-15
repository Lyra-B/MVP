# This migration comes from fullcalendar_engine (originally 20150415201231)
class RenameFullcalendarEngineEventsToFullcalendarEngineSessions < ActiveRecord::Migration
  def change
     rename_table :fullcalendar_engine_events, :fullcalendar_engine_sessions
  end
end

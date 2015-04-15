# This migration comes from fullcalendar_engine (originally 20150415201251)
class RenameFullcalendarEngineEventSeriesToFullcalendarEngineSessionSeries < ActiveRecord::Migration
  def change
    rename_table :fullcalendar_engine_event_series, :fullcalendar_engine_session_series
  end
end


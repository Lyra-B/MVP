# This migration comes from fullcalendar_engine (originally 20150416162908)
class AddCoachIdToFullcalendarEngineSessions < ActiveRecord::Migration
  def change
    add_column :fullcalendar_engine_sessions, :coach_id, :integer
  end
end

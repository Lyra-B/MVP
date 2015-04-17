# This migration comes from fullcalendar_engine (originally 20150416163037)
class AddAdministratorIdToFullcalendarEngineSessions < ActiveRecord::Migration
  def change
    add_column :fullcalendar_engine_sessions, :administrator_id, :integer
  end
end

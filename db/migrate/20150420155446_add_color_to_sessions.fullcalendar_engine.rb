# This migration comes from fullcalendar_engine (originally 20150420153613)
class AddColorToSessions < ActiveRecord::Migration
  def change
    add_column :fullcalendar_engine_sessions, :color, :string
  end
end

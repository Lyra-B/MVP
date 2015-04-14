class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :name
      t.datetime :start_date
      t.datetime :end_date
      t.string :description
      t.integer :coach_id
      t.integer :school_id

      t.timestamps null: false
    end
  end
end

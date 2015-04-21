class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :coach_id
      t.integer :administrator_id
      t.integer :session_id
      t.string :status

      t.timestamps null: false
    end
  end
end

class CreateLessonPlans < ActiveRecord::Migration
  def change
    create_table :lesson_plans do |t|

      t.timestamps null: false
    end
  end
end

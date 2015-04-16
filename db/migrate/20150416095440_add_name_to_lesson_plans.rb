class AddNameToLessonPlans < ActiveRecord::Migration
  def change
    add_column :lesson_plans, :name, :string
  end
end

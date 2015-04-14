class AddLastNameToCoach < ActiveRecord::Migration
  def change
    add_column :coaches, :last_name, :string
  end
end

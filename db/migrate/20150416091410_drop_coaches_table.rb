class DropCoachesTable < ActiveRecord::Migration
  def up
    drop_table :coaches
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end

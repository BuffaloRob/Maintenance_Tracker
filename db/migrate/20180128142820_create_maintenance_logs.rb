class CreateMaintenanceLogs < ActiveRecord::Migration
  def change
    create_table :maintenance_logs do |t|
      t.string :notes
      t.string :tools
      t.integer :cost
      t.datetime :date_performed
      t.datetime :date_due
      t.references :maintenance_category, index: true, foreign_key: true
      t.references :maintenance_item, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

class CreateMaintenanceCategories < ActiveRecord::Migration
  def change
    create_table :maintenance_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

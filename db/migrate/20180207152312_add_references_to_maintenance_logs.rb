class AddReferencesToMaintenanceLogs < ActiveRecord::Migration
  def change
    add_reference :maintenance_logs, :maintenance_item, index: true
    remove_column :maintenance_categories, :maintenance_item_id, :integer
  end
end

class RemoveMaintenanceItemIdFromMaintenanceLogs < ActiveRecord::Migration
  def change
    remove_column :maintenance_logs, :maintenance_item_id
  end
end

class AddMaintenanceItemIdToMaintenanceCategories < ActiveRecord::Migration
  def change
    add_reference :maintenance_categories, :maintenance_item
  end
end

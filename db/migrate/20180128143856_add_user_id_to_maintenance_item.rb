class AddUserIdToMaintenanceItem < ActiveRecord::Migration
  def change
    add_reference :maintenance_items, :user
  end
end

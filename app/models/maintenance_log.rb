class MaintenanceLog < ActiveRecord::Base
  belongs_to :maintenance_category
  belongs_to :maintenance_item


end

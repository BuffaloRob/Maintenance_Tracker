class MaintenanceCategory < ActiveRecord::Base
  has_many :item_categories
  has_many :maintenance_logs
end

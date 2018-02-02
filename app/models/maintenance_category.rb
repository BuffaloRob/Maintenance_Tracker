class MaintenanceCategory < ActiveRecord::Base
  belongs_to :maintenance_item
  has_many :maintenance_logs
end

class MaintenanceCategory < ActiveRecord::Base
  belongs_to :maintenance_items
  has_many :maintenance_logs

end

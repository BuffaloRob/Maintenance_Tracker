class MaintenanceCategory < ActiveRecord::Base
  has_many :maintenance_items, :through => :maintenance_logs
  has_many :maintenance_logs
  validates :name, presence: true
end

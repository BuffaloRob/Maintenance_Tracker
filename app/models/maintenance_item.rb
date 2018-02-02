class MaintenanceItem < ActiveRecord::Base
  belongs_to :user
  has_many :maintenance_categories
  has_many :maintenance_logs
end

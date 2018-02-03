class MaintenanceCategory < ActiveRecord::Base
  has_many :item_categories
  has_many :maintenance_items, :through => :item_categories
  has_many :maintenance_logs

end

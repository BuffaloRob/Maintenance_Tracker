class MaintenanceItem < ActiveRecord::Base
  belongs_to :user
  has_many :item_categories
  has_many :maintenance_categories, :through => :item_categories
  has_many :maintenance_logs
end

class MaintenanceItem < ActiveRecord::Base
  belongs_to :user
  has_many :maintenance_categories, :through => :maintenance_logs
  has_many :maintenance_logs, :dependent => :destroy
  validates :name, presence: true
end

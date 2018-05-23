class MaintenanceLogsSerializer < ActiveModel::Serializer
  attributes :id, :notes, :tools, :cost, :date_performed, :date_due

  belongs_to :maintenance_category
  belongs_to :maintenance_item
end

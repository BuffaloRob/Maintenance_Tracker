class MaintenanceCategoriesSerializer < ActiveModel::Serializer
  attributes :id

  has_many :maintenance_logs
  has_many :maintenance_items
end

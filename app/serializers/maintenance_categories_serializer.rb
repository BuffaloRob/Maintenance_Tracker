class MaintenanceCategoriesSerializer < ActiveModel::Serializer
  attributes :id

  has_many :maintenance_logs
end

class MaintenanceCategoriesSerializer < ActiveModel::Serializer
  attributes :id

  belongs_to :maintenance_item
  has_many :maintenance_logs
end

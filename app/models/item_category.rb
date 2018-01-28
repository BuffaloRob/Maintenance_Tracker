class ItemCategory < ActiveRecord::Base
  belongs_to :maintenance_item
  belongs_to :maintenance_category
end

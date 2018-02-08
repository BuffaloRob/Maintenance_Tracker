class MaintenanceLog < ActiveRecord::Base
  belongs_to :maintenance_category
  belongs_to :maintenance_item
  accepts_nested_attributes_for :maintenance_category #reject_if: category_blank?

  def maintenance_category_attributes=(category_attributes)
    category = MaintenanceCategory.find_or_create_by(category_attributes)
    self.maintenance_category = category 
  end

  def category_blank?(att)
    att['name'].blank?
  end

  def self.past_due
    #returns list of all logs that are past due
    where("date_due <=?", Time.now)
  end

  def self.upcoming
    #returns list of all logs that'll be due in the next month
    where("date_due <=?", Time.now + 30.days)
  end

end

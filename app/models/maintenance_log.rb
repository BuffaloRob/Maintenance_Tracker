class MaintenanceLog < ActiveRecord::Base
  belongs_to :maintenance_category
  belongs_to :maintenance_item

  def self.past_due
    #returns list of all logs that are past due
    where("date_due <=?", Time.zone.today.end_of_day)
  end

  def self.upcoming
    #returns list of all logs that'll be due in the next month
    where("date_due <=?", Time.now + 30.days)
  end

end

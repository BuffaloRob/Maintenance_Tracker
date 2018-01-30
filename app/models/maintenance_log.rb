class MaintenanceLog < ActiveRecord::Base
  belongs_to :maintenance_category
  belongs_to :maintenance_item

  def formatted_time
    strftime("%b %d, %Y")
  end

  def time_entered?
    #returns true if date_performed/date_due exists
  end
end

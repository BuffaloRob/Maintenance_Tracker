module MaintenanceLogsHelper
  def formatted_time
    strftime("%b %d, %Y")
  end

  def time_entered?
    #returns true if date_performed/date_due exists
  end
end

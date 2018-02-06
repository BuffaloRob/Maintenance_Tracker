module MaintenanceLogsHelper

  def formatted_date_performed(maintenance_log)
    maintenance_log.date_performed.strftime("%b %d, %Y")
  end

  def formatted_date_due(maintenance_log)
    maintenance_log.date_due.strftime("%b %d, %Y")
  end

  def upcoming_work
    #returns list of all maintenance categories that are due in the next month
  end

  def time_entered?
    #returns true if date_performed/date_due exists
  end
end

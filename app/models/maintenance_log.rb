class MaintenanceLog < ActiveRecord::Base
  belongs_to :maintenance_category
  belongs_to :maintenance_item
  validates :cost, numericality: true
  validate :starts_after_today?, :due_before_start?
  # accepts_nested_attributes_for :maintenance_category, reject_if: category_blank?

  def maintenance_category_attributes=(category_attributes)
    #check to make sure either radio pressed or name typed in, can only be one or the other
    category = MaintenanceCategory.find_or_create_by(category_attributes)
    self.maintenance_category = category 
  end

  def starts_after_today?
    if date_performed.present? && date_performed > Date.today
      errors.add(:date_performed, "can't be in the future")
    end
  end

  def due_before_start?
    if date_due.present? && date_due < date_performed
      errors.add(:date_due, "can't be before the performed date")
    end
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

  # def self.current_user_logs
  #   @current_logs=[]
  #   @items = current_user.maintenance_items
  #   @items.each do |item|
  #     item.maintenance_logs.each do |log|
  #      @current_logs << log
  #     end
  #   end
  # end

end

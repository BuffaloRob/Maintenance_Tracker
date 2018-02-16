class MaintenanceLog < ActiveRecord::Base
  belongs_to :maintenance_category
  validates_presence_of :maintenance_category
  # validates_associated :maintenance_category

  belongs_to :maintenance_item
  validates :cost, numericality: true
  validate :starts_after_today?, :due_before_start?

  def maintenance_category_attributes=(category_attributes)
    #ensures that radio button only used if the fill in the name spot is empty
    if category_attributes[:name].empty?
      category = MaintenanceCategory.find_by(id: category_attributes[:id])
    else
      category = MaintenanceCategory.find_or_create_by(name: category_attributes[:name])
    end
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

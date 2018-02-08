# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
MaintenanceItem.destroy_all
MaintenanceCategory.destroy_all
MaintenanceLog.destroy_all

User.create(email: 'tom@tom.com', password: 'password', password_confirmation: 'password')

MaintenanceItem.create(name: 'GT86', user_id: 1)

MaintenanceItem.create(name: 'House', user_id: 1)

MaintenanceCategory.create(name: 'Oil Change')

MaintenanceCategory.create(name: 'HVAC Filters')

MaintenanceLog.create(date_performed: 200.days.ago, date_due: Time.now, tools: 'wrench, rags, drip pan', cost: 40, notes: 'oil change note', maintenance_category_id: 1, maintenance_item_id: 1)

MaintenanceLog.create(date_performed: 120.days.ago, date_due: Time.now + 20, tools: 'screwdriver', cost: 20, notes: 'HVAC note', maintenance_category_id: 2, maintenance_item_id: 2)
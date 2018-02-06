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

tom = User.create(email: 'tom@tom.com', password: 'password', password_confirmation: 'password')

car = MaintenanceItem.create(name: 'GT86', user_id: 1 )

oil_change = MaintenanceCategory.create(name: 'Oil Change')

join_table = ItemCategory.create(maintenance_item_id: 1, maintenance_category_id: 1)

log1 = MaintenanceLog.create(date_performed: 10.days.ago, date_due: Time.now, tools: 'wrench, rags, drip pan', cost: 40, notes: 'sample note', maintenance_category_id: 1, maintenance_item_id: 1)
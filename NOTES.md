Messages:

- User wants to know when is the maintenance item due
- User wants to know When was the maintenance item performed
- User wants to know what are the users maintenance categories (car, house, lawnmower)
- User wants to know what maintenance items are in each maintenance category
- how much did the maintenance item cost
- What maintenance items are due this week, month, year
- transfer my car record to another user
- Equipment/Item/Class/Genre (car) has maintenance category/type (oil change) which has maintenance items (specific oil change)

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Features:
1) link maintenance item to google/apple calendars
2) home page shows what maintenance items are coming up
3) can upload pics of receipts
4) can transfer a maintenance category's record to another user
5) How much has been spent on maintenance over last month, year, lifetime
6) link to spare parts
7) Auto populate new maintenance items with previous maintenance items of the same kind's data (i.e. if i say i want to schedule a new oil change it'll populate how much oil I'll need, oil type, filter part No., tools needed)
8) Can use camera phone to auto populate tech data from a manual (think of what evernote does with business cards or apple does with credit cards)
9) Create 'Mechanic's Access' to allow mechanics the ability to add entries that a User shares with them. They can edit any entry they make but no others.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Object Descriptions:

Maintenance Item - The object that maintenance will be performed on
Maintenance Type - The type of maintenance that will be performed
Maintenance Task - The specific instance of a Maintenance Type that will be performed

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Site Flow:
1) user logs in/signs-up
2) directed to root page that shows all maintenance items and upcoming maintenance items that are due
3) add maintenance_item
4) add maintenance_category to maintenance_item
5) add maintenance_log to maintenance_item
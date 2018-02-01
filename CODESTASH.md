#/app/views/maintenance_items/_form.html.erb

from line 2:
  <%= f.hidden_field :maintenance_category_id %>
--------------------------------------------------------

#app/views/maintenance_items/show

from line 7:
<%= link_to  "Add a New Maintenance Category", new_maintenance_item_maintenance_category_path %><br>
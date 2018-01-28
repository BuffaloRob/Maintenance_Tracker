class CreateItemCategories < ActiveRecord::Migration
  def change
    create_table :item_categories do |t|
      t.references :maintenance_item, index: true, foreign_key: true
      t.references :maintenance_category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

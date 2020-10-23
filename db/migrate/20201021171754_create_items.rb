class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :item_details
      t.integer :status_id
      t.integer :category_id
      t.integer :delivery_charge_id
      t.integer :delivery_area_id
      t.integer :delivery_period_id
      t.integer :price
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

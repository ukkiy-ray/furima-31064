class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture
      t.string :city,           default: ""
      t.string :building_name,  default: ""
      t.string :address,        default: ""
      t.string :phone_number,   default: ""
      t.references :buyer,                     null: false,  foreign_key: true
      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :postal_code,                 null: false
      t.string :prefacture,                  null: false
      t.string :city,                        null: false
      t.string :house_number,                null: false
      t.string :building_name,               null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

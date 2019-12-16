class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,            null: false
      t.string :description,     null: false
      t.string :condition,       null: false
      t.string :feepayer,        null: false
      t.string :method,          null: false
      t.integer :region_id,      null: false
      t.string :days,            null: false
      t.string :price,           null: false
      t.string :category,        null: false
      t.references :user, foreign_key: true
      t.timestamps
      
    end
  end
end

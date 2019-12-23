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
      t.references :seller, foreign_key: {to_table: :users}
      t.references :buyer, foreign_key: {to_table: :users}

      t.timestamps
      
    end
  end
end

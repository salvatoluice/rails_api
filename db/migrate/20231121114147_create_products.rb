class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :image
      t.decimal :price
      t.date :expiry_date
      t.string :special_code
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end

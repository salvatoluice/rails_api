class CreateShopFollowers < ActiveRecord::Migration[7.1]
  def change
    create_table :shop_followers do |t|
      t.references :shop, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

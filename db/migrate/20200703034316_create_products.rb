class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.references :category, null: false, foreign_key: true
      t.integer :brand_id
      t.integer :status_id, null: false
      t.boolean :sell, default: false, null: false
      t.integer :price, null: false
      t.string :postage, null: false
      t.string :area, null: false
      t.integer :day_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

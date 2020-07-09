class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :text, null: false
      t.references :category, null: false
      t.references :brand, foreign_key: true
      t.references :status, null: false, foreign_key: true
      t.integer :price, null: false
      t.string :postage, null: false
      t.string :area, null: false
      t.references :day, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end

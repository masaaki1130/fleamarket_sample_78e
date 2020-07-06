class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :image, null: false
      t.string :name, null: false
      t.text :text, null: false
      t.references :category, null: false
      t.references :brand
      t.string :status, null: false
      t.string :charges, null: false
      t.integer :price, null: false
      t.string :postage, null: false
      t.string :area, null: false
      t.string :day, null: false
      t.references :user, null: false
      t.timestamps
    end
  end
end

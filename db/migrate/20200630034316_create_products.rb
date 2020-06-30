class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :image
      t.string :name
      t.text :text
      t.references :category_id
      t.references :brand_id
      t.string :status
      t.string :charges
      t.integer :price
      t.string :postage
      t.string :area
      t.string :day
      t.references :user_id
      t.timestamps
    end
  end
end

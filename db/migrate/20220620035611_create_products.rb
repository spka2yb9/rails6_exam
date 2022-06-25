class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.integer :maker_id
      t.string :no
      t.string :name
      t.string :image_path
      t.string :category
      t.integer :price
      t.text :description
      t.date :release_date

      t.timestamps
    end
  end
end

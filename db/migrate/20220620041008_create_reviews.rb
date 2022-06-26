class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :product_id
      t.string :review_user_name
      t.text :content
      t.string :tags
      t.float :total_evaluation
      t.integer :price_evaluation
      t.integer :design_evaluation
      t.integer :quality_evaluation

      t.timestamps
    end
  end
end

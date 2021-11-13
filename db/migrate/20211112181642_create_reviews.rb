class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :category
      t.text :description
      t.string :img_url_1
      t.string :img_url_2
      t.string :img_url_3
      t.decimal :stars
      t.integer :authors_grade
      t.integer :stars_amount

      t.timestamps
    end
   end
end

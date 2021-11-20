class RemoveColsFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :img_url_1, :string
    remove_column :reviews, :img_url_2, :string
    remove_column :reviews, :img_url_3, :string
    remove_column :reviews, :stars_amount, :integer
  end
end

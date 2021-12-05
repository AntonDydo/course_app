class RemoveDescriptionFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :description, :text
  end
end

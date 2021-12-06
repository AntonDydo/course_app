class AddLikedtimesToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :TotalLiked, :integer, default:0
  end
end

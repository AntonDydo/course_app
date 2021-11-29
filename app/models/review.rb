class Review < ApplicationRecord
	 include PgSearch::Model
	belongs_to :user
	has_rich_text :rich_description
	has_many :favorite_reviews
	has_many :favorited_by, through: :favorite_reviews, source: :user

 
    pg_search_scope :search, against: [:title, :category], associated_against: {
    rich_text_rich_description: [:body]
    }
end

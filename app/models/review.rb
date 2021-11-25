class Review < ApplicationRecord
	belongs_to :user
	has_rich_text :rich_description
	has_many :favorite_reviews
	has_many :favorited_by, through: :favorite_reviews, source: :user
end

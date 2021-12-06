class Review < ApplicationRecord
	HIGH_RAITING = 10
    acts_as_votable
	include PgSearch::Model
	validates :category, inclusion: {in: %w(game film book series игра фильм книга сериал), 
	 	message: I18n.t('reviews.categories')}
	validates :authors_grade, inclusion: {in:1..10, message: I18n.t('reviews.grade_error_message')}
	belongs_to :user
	has_rich_text :rich_description
	has_many :favorite_reviews
	has_many :favorited_by, through: :favorite_reviews, source: :user

    pg_search_scope :search, against: [:title, :category], associated_against: {
    rich_text_rich_description: [:body]
    }
    
end

class Review < ApplicationRecord
	belongs_to :user
	has_rich_text :rich_description
end

json.extract! review, :id, :title, :category, :description, :img_url_1, :img_url_2, :img_url_3, :stars, :authors_grade, :stars_amount, :created_at, :updated_at
json.url review_url(review, format: :json)

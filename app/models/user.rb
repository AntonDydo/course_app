class User < ApplicationRecord
  has_many :reviews
  has_many :favorite_reviews
  has_many :favorites, through: :favorite_reviews, source: :review 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
end

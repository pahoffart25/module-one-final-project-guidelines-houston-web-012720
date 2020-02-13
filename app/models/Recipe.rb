class Recipe < ActiveRecord::Base
    has_many :kitchens
    has_many :users, through: :kitchens
    has_many :meals
    has_many :ingredients, through: :meals
end
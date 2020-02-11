class Ingredient < ActiveRecord::Base
    # has_many :recipes
    has_many :meals
    has_many :recipes, through: :meals
    
end
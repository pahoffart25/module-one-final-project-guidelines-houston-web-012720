class User < ActiveRecord::Base
    has_many :recipes
    has_many :recipes through: :recipe_book
end
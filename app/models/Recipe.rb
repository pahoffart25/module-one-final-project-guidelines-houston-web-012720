class Recipe < ActiveRecord::Base
    has_many :users
    has_many :users, through: :recipe_book
    #testing commit
end
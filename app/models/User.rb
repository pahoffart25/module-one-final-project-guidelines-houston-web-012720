class User < ActiveRecord::Base
    # has_many :recipes
    has_many :kitchens
    has_many :recipes, through: :kitchens
    
end
class Recipe < ActiveRecord::Base
    # has_many :users
    has_many :kitchens
    has_many :users, through: :kitchens
    #testing commit
end
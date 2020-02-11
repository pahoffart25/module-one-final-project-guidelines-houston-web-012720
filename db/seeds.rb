require 'pry'
require 'httparty'

# Recipe.destroy_all
# User.destroy_all
# Kitchen.destroy_all
# Meal.destroy_all
# Ingredient.destroy_all




# r1 = Recipe.create(title: "Potatomashroom", description:"how to do that in the oven now you have to " , calorie: 345 , time: 30)
# r2 = Recipe.create(title: "Pizza", description:"type to do that in the oven now you have to " , calorie: 456 , time: 49)
# r3 = Recipe.create(title: "chicken", description:"se to do that in the oven now you have to " , calorie: 457 , time: 46)
# r4 = Recipe.create(title: "steak", description:"there to do that in the oven now you have to " , calorie: 567 , time: 56)
 
 
# user1 = User.create(user_name: "Paul", password: "hey")
# user2 = User.create(user_name: "Somaia", password: "abc")
# user3 = User.create(user_name: "Vien", password: "sdf")
# user4 = User.create(user_name: "Gian", password: "tyu")
# user5 = User.create(user_name: "Anam", password: "yut")
# user6 = User.create(user_name: "Stephen", password: "")


# Kitchen.create(user_id: user1.id , recipe_id: r1.id )
# Kitchen.create(user_id: user1.id , recipe_id: r2.id )
# Kitchen.create(user_id: user3.id , recipe_id: r3.id )
# Kitchen.create(user_id: user2.id , recipe_id: r4.id )
# Kitchen.create(user_id: user1.id , recipe_id: r2.id )
# Kitchen.create(user_id: user3.id , recipe_id: r3.id )



# ingredient1 = Ingredient.create(name: "egg", description: "some eggin")
# ingredient2 = Ingredient.create(name: "tomato", description: "some tomato")
# ingredient3 = Ingredient.create(name: "garlic", description: "some garlic")

# meal1 = Meal.create(recipe_id: r1.id , ingredient_id: ingredient1.id , amount: 3)
# meal2 = Meal.create(recipe_id: r1.id , ingredient_id: ingredient2.id , amount: 4)
# meal3 = Meal.create(recipe_id: r1.id , ingredient_id: ingredient3.id , amount: 1)

response = HTTParty.get("https://api.edamam.com/search?q=beef&app_id=18bc3679&app_key=94a62e328e3e1f0fdcdfe2b7101a9f32&from=0&to=3&calories=591-722&health=alcohol-free")

# CLASS RECIPE
# response["hits"].each do |hit|
#    p hit["recipe"]["label"]    #get us the title for all the dishes


# response["hits"].each do |hit|  ##get us the calorie for all the dishes
#     p hit["recipe"]["calories"]
# end

# response ["hits"].each do |hit|
#     p hit["recipe"]["totalTime"]  #to get our time
# end

# response ["hits"].each do |hit|
#     p hit["recipe"]["url"]  #to get our description
# end


# CLASS INGREDIENT

# response["hits"].each do |hit|
#      hit["recipe"]["ingredients"].map{|a| p a["text"]}.uniq
# end

# response["hits"].each do |hit|
#     hit["recipe"]["ingredients"].map{|a| p a["weight"]}
# end





 binding.pry 
0



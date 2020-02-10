 User.create(user_name: "Paul", password: "hey")
 User.create(user_name: "Somaia", password: "abc")
User.create(user_name: "Vien", password: "sdf")
 User.create(user_name: "Gian", password: "tyu")
 User.create(user_name: "Anam", password: "yut")
 User.create(user_name: "Stephen", password: "")

r1 = Recipe.create(title: "Potatomashroom", description:"how to do that in the oven now you have to " , calorie: 345 , time: 30)
r2 = Recipe.create(title: "Pizza", description:"type to do that in the oven now you have to " , calorie: 456 , time: 49)
r3 = Recipe.create(title: "chicken", description:"se to do that in the oven now you have to " , calorie: 457 , time: 46)
r4 = Recipe.create(title: "steak", description:"there to do that in the oven now you have to " , calorie: 567 , time: 56)

RecipeBook.create(user_id: user1.id , recipe_id: r1.id )
RecipeBook.create(user_id: user1.id , recipe_id: r2.id )
RecipeBook.create(user_id: user3.id , recipe_id: r3.id )
RecipeBook.create(user_id: user2.id , recipe_id: r4.id )
RecipeBook.create(user_id: user1.id , recipe_id: r2.id )
RecipeBook.create(user_id: user3.id , recipe_id: r3.id )



require_relative '../config/environment'



# Here we inherit from Prompt, to get all CLI methods (not strictly necessary though)
class CLI < TTY::Prompt

   # user that is currently logged in (nil if none)
   @user = nil


   def greet

      a = Artii::Base.new
      welcome =  a.asciify ('Welcome to the kitchen!')
      puts welcome.colorize(:red)
      # method of prompt

   end

   def ask_username
      ask('What is your name?', default: ENV['USER']) # method of prompt, default is the system user
   end

   def ask_password
      mask('What is your password?') # method of prompt that gives us password input
   end
   


   #1) I want to enter name and password , and my data be saved , have option of login or new_user
   def login_or_register
      username = ask_username
      password = ask_password

      user = User.find_by(user_name: username) # get user from db
      if user
         if user.password == password     #check if password valid and set user logged in
            say('You are now logged in.')
            @user = user
         else
            say('Access denied! Wrong password.') #THIS RETURNS MESSAGE BUT STILL LOGS IN?
         end
      elsif yes?('You are not yet registered. Do you want to register?')  # method of prompt for yes/no
         @user = User.create(user_name: username , password: password)    # we create the given user
      end
   end

   def logout
      @user = nil  # set user logged in to nil
   end

   def menu

      greet     # first greet

      while true   # forever repeat

      if !@user
         login_or_register  # login if not done yet
      end

     if @user

      # select is a method of prompt here
      select('Menu - I want to') do |menu|     # syntax for select of prompt (checkout docs), dispatches chosen actions

         menu.choice 'list all recipes', -> { list_all_recipes }   # first parameter is the option to chose and second is method to call

         menu.choice 'find recipes by ingredients', -> { find_recipes_by_ingredients }

         menu.choice 'find a recipe by title', -> { find_recipe_by_title }

         menu.choice 'find recipes by calories', -> { find_recipes_by_calories }

         menu.choice 'find recipes by time', -> { find_recipes_by_time }

         menu.choice 'show recipes in my kitchen', -> { show_recipes_in_my_kitchen }

         menu.choice 'logout', -> { logout }

      end

      end


      end
   end


   def add_recipe_to_kitchen(recipe)  # adds a recipe to the kitchen of the logged in user (called from view recipe)
      kitchen = Kitchen.create()
      @user.kitchens << kitchen
      recipe.kitchens << kitchen
   end

   def delete_recipe_from_kitchen(recipe)  # deletes a recipe from the kitchen of the logged in user (called from view recipe)
      kitchen = Kitchen.where(user: @user , recipe: recipe)
      kitchen.first.destroy  # get the first result object and delete it from the db
   end


   def view_recipe(recipe)   # method to view a recipe
      if recipe              # only view valid recipes
         say(recipe.title)
         say(recipe.description)
         say('Calories: ' + recipe.calorie.to_s)
         say('Time: ' + recipe.time.to_s)
         # select actions to add to or delete from the kitchen
         select('I want to') do |menu|     # select actions for viewed recipe
            if !recipe.users.include?(@user)  # show option to add recipe if recipe not in user's kitchen
               menu.choice 'add this recipe to my kitchen', -> { add_recipe_to_kitchen(recipe) }  
            else # if recipe is already in user's kitchen, offer option to delete
               menu.choice 'delete this recipe from my kitchen', -> { delete_recipe_from_kitchen(recipe) } 
            end # do nothing and return without modifying the kitchen
            menu.choice 'go back to menu', -> { nil }   # do no actiion and return
         end
            
      else
         say('No such recipe.')  # if not a valid recipe, say so
      end
   end

   def list_recipes recipes  # prints a result list of ingredients to the user
      if recipes.count > 0   # only print if there are recipes in list
         recipe = select('Found:', recipes.map { |r| {name: r.title , value: r} })  # select recipes based on title and show them
         view_recipe recipe # view the selected recipe
      else
         say('No recipes were found.')  # if none found, say so
      end      
   end


   def list_all_recipes              # list all of them from the db
     list_recipes Recipe.all
   end

   def find_recipes_by_ingredients

   say('As a user, I want to enter an list of ingredients (select from list on cli) and be given a list of all recipes that can be prepared with the entered ingredients.') 
   # print a list of all known ingredients and offer a multiple choice selection
   
   # ingredients = multi_select("Select ingredients",Ingredient.all.map {|i| i.name})
   ingredients = multi_select("Select ingredients",Ingredient.pluck(:name))

   #  TODO We would need to select from all recipes, where these recipe's ingredients are contained in the chosen ingredients.
      
   ingredients = Ingredient.where(name: ingredients)
   recipes = ingredients.map { |i| i.recipes }.flatten.uniq

   list_recipes recipes 
   end


   # As a user, I want to find recipes by name and retrieve a list of all ingredients needed to prepare that recipe.
   def find_recipe_by_title
      view_recipe(Recipe.find_by(title: ask('Which recipe would you like to look for?')))     # ask for recipe title, search for it and display
   end

   # As a user, I want to enter a calorie limit and retrieve a list of all recipes that match the given calorie limit.
   def find_recipes_by_calories
      list_recipes(Recipe.where('calorie < ?' , ask('Maximum number of calories?')))  # prompt user for max calories, query the database and list results
   end

   # As a user I want to enter a time range, and able to return all the recipes within that time range
   def find_recipes_by_time
      list_recipes(Recipe.where('time < ?' , ask('Maximum number of minutes?')))   # prompt user for max time, query the database and list results
   end

   # As a user I will be able to delete a recipe from my Kitchen.
   def show_recipes_in_my_kitchen
      list_recipes(@user.recipes) # just list all recipes associated to the users kitchen
   end

end


cli = CLI.new
cli.menu





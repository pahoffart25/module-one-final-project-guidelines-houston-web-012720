require_relative '../config/environment'
require 'pry'
require "tty-prompt"

@curr_user = nil
$prompt = TTY::Prompt.new


# #method to create a new user
# def create_user
#     name = $prompt.ask ("What would you like your user name to be?") 
#     password = $prompt.mask("What would you like your password to be?") 
#     User.create(user_name: name, password: password)
# end
# # p create_user

# #method to check if user exist
# def check_info
#     name = $prompt.ask("Enter your user name")
#     if User.exists?(user_name: name)
#     password = $prompt.mask("Enter password")
#     "Welcome back #{name}"
#     else
#         sleep(1)
#         puts "Sorry that user name does not exist"
#         sleep(1)
#         create_user
#     end
# end
# # p check_info

#  def greeting
#     selection = $prompt.ask("Welcome, are you a current user? Yes/No")
#       if selection == "Yes"
#           check_info
#       else 
#           create_user
#       end
#   end
#   p greeting



# # gets all the recipes for current user..
# def saved_recipes
#     arr = []
#     recipes = Kitchen.all.select{|r| r.user_id == @curr_user.user_id}
#     recipes.each_with_index do |r, index|
#         arr << "#{index+1}: #{r.recipe.title}"
#     end
#     puts "Here are your recipes"
#     puts arr
# end
#   p saved_recipes
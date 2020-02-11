require_relative '../config/environment'
require 'pry'
require "tty-prompt"

$prompt = TTY::Prompt.new


#method to create a new user
def create_user
    name = $prompt.ask ("What would you like your user name to be?") 
    password = $prompt.mask("What would you like your password to be?") 
    User.create(user_name: name, password: password)
end
# p create_user

#method to check if user exist
def check_info
    name = $prompt.ask("Enter your user name")
    if User.exists?(user_name: name)
    password = $prompt.mask("Enter password")
    "Welcome back #{name}"
    else
        sleep(1)
        puts "Sorry that user name does not exist"
        sleep(1)
        create_user
    end
end
# p check_info

def greeting
    selection = $prompt.ask("Welcome, are you a current user? Yes/No")
      if selection == "Yes"
          check_info
      else 
          create_user
      end
  end
  p greeting
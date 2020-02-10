require_relative '../config/environment'
require pry
require "tty-prompt"

$prompt = TTY::Prompt.new

# def greeting
#      $prompt.select("Welcome, are you a current user or new user?", %w(Current, New))
# end
# p greeting


def get_info
    # users ={}
    $prompt.ask("Enter your user name")
    name = gets.chomp
    users = User.find_by(user_name: name) 
    users.each{|user| p user.user_name}
    binding.pry
end
p get_info

require_relative '../config/environment'
require 'launchy'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

spinner = TTY::Spinner.new
prompt = TTY::Prompt.new

interface = Interface.new
logged_in_user = interface.welcome()

if logged_in_user.nil?
    prompt.yes?("Wrong username. Would you like to create a new username with that name?")
        logged_in_user = Trainer.handle_new_trainer
end
interface.user = logged_in_user

logged_in_user = interface.user.main_menu()



# binding.pry
puts "hello world"

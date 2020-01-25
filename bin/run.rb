require_relative '../config/environment'
# require_relative '../PokemonBlueRed-Route4.mp3'
require 'pry'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

spinner = TTY::Spinner.new
prompt = TTY::Prompt.new
                                                                                                                          
                                                                                                                                   

                                                                                                                                                                                                                                                                      

interface = Interface.new

# pid = fork{ exec `afplay Music_Pokemon_Opening_rdblu.mp3` }                                                                                                                                             
logged_in_user = interface.welcome()
while logged_in_user.nil?
    # binding.pry
    logged_in_user = interface.welcome()
end
# pid = fork{ exec `killall afplay` }

interface.user = logged_in_user
interface.user.main_menu()




# binding.pry
puts "hello world"

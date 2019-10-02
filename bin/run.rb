require_relative '../config/environment'
require 'launchy'

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil



interface = Interface.new



logged_in_user = interface.welcome()
interface.user = logged_in_user

logged_in_user = interface.user.main_menu()



# binding.pry
puts "hello world"

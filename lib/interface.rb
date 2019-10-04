class Interface
    attr_reader :prompt
    attr_accessor :user
    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome  
puts <<-ASCII

                                                                                                                                                                
                                                                                                                                                                
PPPPPPPPPPPPPPPPP        OOOOOOOOO     KKKKKKKKK    KKKKKKKEEEEEEEEEEEEEEEEEEEEEEMMMMMMMM               MMMMMMMM     OOOOOOOOO     NNNNNNNN        NNNNNNNN !!! 
P::::::::::::::::P     OO:::::::::OO   K:::::::K    K:::::KE::::::::::::::::::::EM:::::::M             M:::::::M   OO:::::::::OO   N:::::::N       N::::::N!!:!!
P::::::PPPPPP:::::P  OO:::::::::::::OO K:::::::K    K:::::KE::::::::::::::::::::EM::::::::M           M::::::::M OO:::::::::::::OO N::::::::N      N::::::N!:::!
PP:::::P     P:::::PO:::::::OOO:::::::OK:::::::K   K::::::KEE::::::EEEEEEEEE::::EM:::::::::M         M:::::::::MO:::::::OOO:::::::ON:::::::::N     N::::::N!:::!
  P::::P     P:::::PO::::::O   O::::::OKK::::::K  K:::::KKK  E:::::E       EEEEEEM::::::::::M       M::::::::::MO::::::O   O::::::ON::::::::::N    N::::::N!:::!
  P::::P     P:::::PO:::::O     O:::::O  K:::::K K:::::K     E:::::E             M:::::::::::M     M:::::::::::MO:::::O     O:::::ON:::::::::::N   N::::::N!:::!
  P::::PPPPPP:::::P O:::::O     O:::::O  K::::::K:::::K      E::::::EEEEEEEEEE   M:::::::M::::M   M::::M:::::::MO:::::O     O:::::ON:::::::N::::N  N::::::N!:::!
  P:::::::::::::PP  O:::::O     O:::::O  K:::::::::::K       E:::::::::::::::E   M::::::M M::::M M::::M M::::::MO:::::O     O:::::ON::::::N N::::N N::::::N!:::!
  P::::PPPPPPPPP    O:::::O     O:::::O  K:::::::::::K       E:::::::::::::::E   M::::::M  M::::M::::M  M::::::MO:::::O     O:::::ON::::::N  N::::N:::::::N!:::!
  P::::P            O:::::O     O:::::O  K::::::K:::::K      E::::::EEEEEEEEEE   M::::::M   M:::::::M   M::::::MO:::::O     O:::::ON::::::N   N:::::::::::N!:::!
  P::::P            O:::::O     O:::::O  K:::::K K:::::K     E:::::E             M::::::M    M:::::M    M::::::MO:::::O     O:::::ON::::::N    N::::::::::N!!:!!
  P::::P            O::::::O   O::::::OKK::::::K  K:::::KKK  E:::::E       EEEEEEM::::::M     MMMMM     M::::::MO::::::O   O::::::ON::::::N     N:::::::::N !!! 
PP::::::PP          O:::::::OOO:::::::OK:::::::K   K::::::KEE::::::EEEEEEEE:::::EM::::::M               M::::::MO:::::::OOO:::::::ON::::::N      N::::::::N     
P::::::::P           OO:::::::::::::OO K:::::::K    K:::::KE::::::::::::::::::::EM::::::M               M::::::M OO:::::::::::::OO N::::::N       N:::::::N !!! 
P::::::::P             OO:::::::::OO   K:::::::K    K:::::KE::::::::::::::::::::EM::::::M               M::::::M   OO:::::::::OO   N::::::N        N::::::N!!:!!
PPPPPPPPPP               OOOOOOOOO     KKKKKKKKK    KKKKKKKEEEEEEEEEEEEEEEEEEEEEEMMMMMMMM               MMMMMMMM     OOOOOOOOO     NNNNNNNN         NNNNNNN !!! 
                                                                                                                                                                
                                                                                                                                                                
    

                                        _____________________________________________________________________
                                        ||.__ `-. \, | <  <\`      ( `   |=|     _/ _.-"' | .' | |    ____.||
                                        ||.  `. `--Y.' '.   |\      \ \_ |=| .-"'  `-"+.._|  `.' |`-,',--..||
                                        ||. _ (`    \   |   .\`.     )  '|=||   ,.               ' j 7    .||
                                        ||./"\ \     _.,'   ||\l    .  _.|=||.-'                  /| |    .||
                                        ||.   \ \  ,'.-.`-._,'  |   / /  |=|`.              |    / L`.`""'.||
                                        ||.    \ \ `' ' `--/   | \ / /   |=|  `.,-..._   ,'`"-. ,"  \ `""'.||
                                        ||.     \ .  |\__ - _ ,'` ` /    |=|    Y     `-'     _v   ,'`,.__.||
                                        ||.      . . `-...-"  | `-',     |=|     `.          /    /   /   .||
                                        :=================================================================:
                                        || /..   `.`./ | ; `.' ,"" ,. `..|=|.   '-   __           ,--. ./  ||
                                        ||' | |\  |     "     |  ,'\ |  .|=|._     .:  ).        (`--"| \  ||
                                        ||  | `-| '             /`-' |  .|=|. 7    | `" |         `...'  \ ||
                                        ||.  `._.'              `.__,'  .|=|. |     `--'     '+"        ,".||
                                        ||`._,.__  .    _,         ___ ,.|=|. |   _...        .____     | |||
                                        ||-. \/. `"-.._    _,.--'""\/ "_.|=|. |  .    `.  '--"   /      `./||
                                        ||  `-._ '-.   `--"    _.-'.-"" .|=|..|  '     |   `.   /        / ||
                                        ||      `,.`"..____..""_.-"`.   .|=|. `-. `---"      `-"        /  ||
                                        =====================================================================

                                                            ╔══════════════════════════════╗
                                      ■=====================╫>           Pokémon 	   ╫=====================■
                                                            ╚══════════════════════════════╝                            
ASCII
sleep(1)
        puts "Hello, welcome to World of Unova Region!"
        sleep(1)
        @prompt.select("Are you a returning trainer or a new trainer?") do |menu|
            menu.choice "Returning Trainer", -> {Trainer.handle_returning_trainer}
            menu.choice "New Trainer", -> {Trainer.handle_new_trainer}
            menu.choice "Quit", -> {Interface.log_out}
        end 
    end

    def self.log_out
        exit(true)
    end



    

end


# Returning trainer => work on method and connection to the interface file
#  Self referential connection between tables
# 
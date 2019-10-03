class Interface
    attr_reader :prompt
    attr_accessor :user
    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome
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
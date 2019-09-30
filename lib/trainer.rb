class Trainer < ActiveRecord::Base
  
has_many :pokeballs
has_many :pokemons, through: :pokeballs

    def self.handle_returning_trainer
        puts "Welcome back! What is your username?"
        name = gets.chomp
        self.find_by(name: name)
    end
        
    def self.handle_new_trainer
        puts "What is your name?"
        name = gets.chomp
        puts "Where are you from?"
        hometown = gets.chomp
        Trainer.create(name: name, hometown: hometown)
    end

end
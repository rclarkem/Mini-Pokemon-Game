class Trainer < ActiveRecord::Base
  
has_many :pokeballs
has_many :pokemons, through: :pokeballs

    @@prompt = TTY::Prompt.new

    def self.handle_returning_trainer
        puts "Welcome back! What is your username?"
        name = gets.chomp
        found_user = self.find_by(name: name) 
    end
        
    def self.handle_new_trainer
        puts "What is your name?"
        name = gets.chomp
        puts "Where are you from?"
        hometown = gets.chomp
        Trainer.create(name: name, hometown: hometown)
    end

    def main_menu
        # self.reload
        # system "clear"
        @@prompt.select("What would you like to do?") do |menu|
            menu.choice "View Party", -> {self.view_party_names}
            menu.choice "Edit Party"
            menu.choice "View PokeDex", -> {self.view_pokedex} 
            menu.choice "Request a Trade"
            menu.choice "Request a Battle"
            menu.choice "Log Out"
        end
    end

    def party
        # self.reload
        # system "clear"
        pokemon_i_own = self.pokeballs.map do |pokemon|
            pokemon
        end
        pokemon_i_own
    end

    def view_party_names
        self.reload
        system "clear"
        names = self.party.map do |pokeball|
           puts "name: #{pokeball.pokemon.name}, level:#{pokeball.level}"
        end
        sleep 0.75
        @@prompt.select("Return back to main menu?") do |menu|
            menu.choice "main menu", -> {self.main_menu}
        end
    end

    def view_pokedex
        puts "What pokemon would you like to know about?"
        response = gets.chomp.downcase
        pokemon_names = Pokemon.all.map do |pokemon| 
            if response == pokemon.name.downcase
                Launchy.open("https://bulbapedia.bulbagarden.net/wiki/#{response}_(Pokemon)")
            end
        end
        sleep 1
        ​ @@prompt.select("Return back to main menu?") do |menu|
             menu.choice "main menu", -> {self.main_menu}
        end
    end
    
end
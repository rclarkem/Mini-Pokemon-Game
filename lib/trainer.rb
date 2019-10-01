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
        self.reload
        system "clear"
        @@prompt.select("What would you like to do?") do |menu|
            menu.choice "View Party", -> {self.display_party_names}
            menu.choice "Edit Party", -> {self.edit_party}
            menu.choice "View PokeDex", -> {self.view_pokedex} 
            menu.choice "Request a Trade"
            menu.choice "Request a Battle"
            menu.choice "Log Out"
        end
    end

    def party
        pokemon_i_own = self.pokeballs.select do |pokemon|
            pokemon
        end
        pokemon_i_own
    end

    def edit_party
        @@prompt.select("How would you like to edit your party?") do |menu|
            menu.choice "Re-arrange Party"
            menu.choice "Release Pokemon", -> {self.release_pokemon}
            menu.choice "Back", -> {self.main_menu}
        end
    end

    def release_pokemon
        self.reload
        system "clear"
        # arr = []
        poke_ids = self.party.map do |pokeball|
            {pokeball.pokemon.name => pokeball.id}       
        end
        pokemonid = @@prompt.select("Which Pokemon would you like to release?", poke_ids)
         Pokeball.all.destroy(pokemonid)

    end

    def party_names
        self.reload
        system "clear"
        names = self.party.map do |pokeball|
            "Pokemon: #{pokeball.pokemon.name}, level:#{pokeball.level}"
        end
    end

    def display_party_names
        # self.reload
        # system "clear"
        names = self.party.map do |pokeball|
           puts "name: #{pokeball.pokemon.name}, level:#{pokeball.level}"
        end
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
        ​ @@prompt.select("Return back to main menu?") do |menu|
             menu.choice "main menu", -> {self.main_menu}
        end
    end

    
    
end
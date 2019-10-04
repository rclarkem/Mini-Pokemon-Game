class Trainer < ActiveRecord::Base
    has_many :trades_I_have_initiated, class_name: "Trade", foreign_key: "trade_initiator_id"
    has_many :trainers_initiated, through: :trades_I_have_initiated, source: :trainer

    has_many :trades_I_have_been_targeted_by, class_name: "Trade", foreign_key: "trade_target_id"
    has_many :trainers_targeted_by, through: :trades_I_have_been_targeted_by, source: :trainer

    has_many :pokeballs_given, class_name: "Trade", foreign_key: "traded_pokeball_id"
    has_many :pokeballs_received, class_name: "Trade", foreign_key: "trade_pokeball_id"

    has_many :pokeballs
    has_many :pokemons, through: :pokeballs

    @@prompt = TTY::Prompt.new
    @@spinner = TTY::Spinner.new

    def self.handle_returning_trainer
        puts "Welcome back! What was your name again?".colorize(:blue)
        name = gets.chomp
        @@spinner.auto_spin 
        sleep(1) # Perform task
        @@spinner.stop("Done!")
        sleep(0.75)
        found_user = self.find_by(name: name) 
    end
        
    def self.handle_new_trainer
        puts "What is your name?"
        name = gets.chomp
        while Trainer.find_by(name: name) != nil
            @@spinner.auto_spin 
            sleep(2) # Perform task
            @@spinner.stop('NAME TAKEN!')
            sleep(1)
            puts "Choose a different name"
            sleep(0.85)
            puts "What is your name?"
            name = gets.chomp
        end
        puts "Where are you from?"
        hometown = gets.chomp
        new_trainer = Trainer.create(name: name, hometown: hometown)
        poke_ids = Pokemon.starter_types.map {|pokemon|{pokemon.name => pokemon.id}}
        pokemonid = @@prompt.select("Which pokemon do you want to start with?", poke_ids)
          new_pokemon = Pokeball.create(level: 5, trainer: new_trainer, pokemon: Pokemon.find(pokemonid))
            @@prompt.select("Return back to main menu?") do |menu|
                menu.choice "main menu", -> {new_trainer.main_menu}
            end       
    end

    def main_menu
        self.reload
        system "clear"
        @@prompt.select("What would you like to do?") do |menu|
            menu.choice "View Trainer Card".colorize(:red), -> {self.trainer_id_card}
            menu.choice "View Party", -> {self.display_party_names}
            menu.choice "Edit Party".colorize(:red), -> {self.edit_party}
            menu.choice "View PokeDex", -> {self.view_pokedex} 
            # menu.choice "Request a Trade".colorize(:red), -> {self.request_trades}
            # menu.choice "Request a Battle"
            menu.choice "Safari Zone".colorize(:red), -> {self.catch_pokemon}
            menu.choice "Retire", -> {self.retire}
            menu.choice "Log Out".colorize(:red), -> {Interface.log_out}
        end 
    end

    def trainer_id_card
        self.reload
        system "clear"
        puts "Name: #{self.name}"
        puts "Hometown: #{self.hometown}"
        # puts "Trades enacted:0"
        @@prompt.select("") {|menu| menu.choice "Back", -> {self.main_menu}}
    end

    def party
        self.reload
        system "clear"
        pokemon_i_own = self.pokeballs.select do |pokemon|
            pokemon
        end
            pokemon_i_own
    end

    def edit_party
        @@prompt.select("How would you like to edit your party?") do |menu|
            # menu.choice "Re-arrange Party".colorize(:red), -> {self.rearrange_party}
            menu.choice "Give/Change Pokemon a Nickname", -> {self.give_pokemon_a_nickname}
            menu.choice "Release Pokemon".colorize(:red), -> {self.release_pokemon}
            # menu.choice "Change Pokemon nicknames", -> {self.give_pokemon_a_nickname}
            menu.choice "Back", -> {self.main_menu}
        end
    end

    def give_pokemon_a_nickname
        poke_ids = self.party.map {|pokeball|{pokeball.pokemon.name => pokeball.id}}
        pokemonid = @@prompt.select("Which pokemon do you want to give a nickname?", poke_ids)
        new_name = gets.chomp   
        Pokeball.find(pokemonid).update(nickname: new_name)
        @@prompt.select("Return back to main menu?") do |menu|
            menu.choice "main menu", -> {self.main_menu}
        end
    end

    def release_pokemon
        self.reload
        system "clear"
        poke_ids = self.party.map {|pokeball|{pokeball.pokemon.name => pokeball.id}}
        pokemonid = @@prompt.select("Which Pokemon would you like to release?", poke_ids)
         Pokeball.all.destroy(pokemonid)
         @@prompt.select("Return back to main menu?") do |menu|
            menu.choice "main menu", -> {self.main_menu}
        end
    end

    def display_party_names
        self.reload
        system "clear"
        names = self.party.map do |pokeball|
           puts "Name:#{pokeball.nickname}, #{pokeball.pokemon.name}, Level:#{pokeball.level}"
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
        @@prompt.select("Return back to main menu?") do |menu|
            menu.choice "main menu", -> {self.main_menu}
        end
    end

    # def alphabetically
    #     arr = []
    #     pokemonid = self.party.each do |pokeball| 
    #         arr << [pokeball.pokemon_id, pokeball.level]
    #     end
    #     names = arr.map{|id| Pokemon.find_by(id: id).name}.sort
    #     total = names.map {|name| puts "name: #{name}"}
    #     @@prompt.select("Return back to main menu?") do |menu|
    #      menu.choice "main menu", -> {self.main_menu}
    #      end
    # end

    def rearrange_party
        pokemonid = @@prompt.select("How would you like to sort your pokemon") do |menu|
            menu.choice "Alphabetically", -> {self.alphabetically}
            menu.choice "back", -> {self.main_menu}
        end
    end  

    def retire
        @@prompt.select("Are you sure you want to retire? This will delete your history as a trainer")do |menu|
            menu.choice "Yes", -> {self.destroy}
            menu.choice "No", -> {self.main_menu}
        end
    end

    def catch_pokemon
        # pid = fork{ exec `afplay Music_Battle_Vs_Wild_Pokemon_rdblu.mp3` } 
        size_of_array =  Pokemon.all.size
        random_pokemon = rand(size_of_array) + 1
        level = rand(30) + 1
        pokemonid = Pokemon.all[random_pokemon]
        puts "Its a #{pokemonid.name}"
        yes = @@prompt.yes?("Would you like to throw a pokeball?")
            if yes == true
                Pokeball.create(level: level, trainer: self, pokemon: pokemonid)
            else
                self.main_menu()
            end
        @@prompt.select("") do |menu|
            menu.choice "main menu", -> {self.main_menu}
            
        end
        
    end
    
    
end



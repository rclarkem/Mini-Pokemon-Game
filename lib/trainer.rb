class Trainer < ActiveRecord::Base
  
has_many :pokeballs
has_many :pokemons, through: :pokeballs

    @@prompt = TTY::Prompt.new
    @@spinner = TTY::Spinner.new

    def self.handle_returning_trainer
        puts "Welcome back! What is your username?"
        name = gets.chomp
        @@spinner.auto_spin 
        sleep(1) # Perform task
        @@spinner.stop("Done!")
        sleep(0.75)
        found_user = self.find_by(name: name) 
        # while found_user.nil? 
        #     puts "Wrong username, try again"
        #     sleep(0.75)
        #     puts "What is your username?"
        #     name = gets.chomp
        # end
        # binding
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
        #     @@prompt.select("Choose a starter Pokemon") do |menu|
        #     menu.choice "Bulbasaur"
        #     menu.choice "Charmander", # -> {Pokeball.create(level:5, trainer:new_trainer, pokemon: Pokemon.find_by(name: "Charmander"))}
        #     binding.pry
        #     menu.choice "Squirtle"
        # end
    end

   
        # initialize new Pokeball instance with association
        # Pokeball.create(level:5, trainer: self, pokemon: pokemon )
        # start off initialization of new user with starter pokemon through prompt choice of pokemon

    def main_menu
        self.reload
        system "clear"
        @@prompt.select("What would you like to do?") do |menu|
            menu.choice "View Trainer Card", -> {self.trainer_id_card}
            menu.choice "View Party", -> {self.display_party_names}
            menu.choice "Edit Party", -> {self.edit_party}
            menu.choice "View PokeDex", -> {self.view_pokedex} 
            menu.choice "Request a Trade", -> {self.request_trades}
            menu.choice "Request a Battle"
            menu.choice "Log Out", -> {Interface.log_out}
        end
    end

    def trainer_id_card
        self.reload
        system "clear"
        puts "Name: #{self.name}"
        puts "Hometown: #{self.hometown}"
        puts "Trades enacted:0"
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
            menu.choice "Re-arrange Party", -> {self.rearrage_party}
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
         
         @@prompt.select("Return back to main menu?") do |menu|
            menu.choice "main menu", -> {self.main_menu}
        end
    end

    def party_names
        self.reload
        system "clear"
        names = self.party.map do |pokeball|
            "Pokemon: #{pokeball.pokemon.name}, level:#{pokeball.level}"
        end
    end

    # $toggle = false

    def display_party_names
        self.reload
        system "clear"
        
        names = self.party.map do |pokeball|
           puts "name: #{pokeball.pokemon.name}, level:#{pokeball.level}"
        end
        # if $toggle == true
        #     arr = []
        #     pokemonid = self.party.each do |pokeball| 
        #     arr << [pokeball.pokemon_id, pokeball.level]
        # end
        # names = arr.map{|id| Pokemon.find_by(id: id).name}.sort
        # total = names.map {|name| puts "name: #{name}"}

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

    def alphabetically
        # $toggle = true
        arr = []
        pokemonid = self.party.each do |pokeball| 
            arr << [pokeball.pokemon_id, pokeball.level]
        end
        names = arr.map{|id| Pokemon.find_by(id: id).name}.sort
        total = names.map {|name| puts "name: #{name}"}
        @@prompt.select("Return back to main menu?") do |menu|
         menu.choice "main menu", -> {self.main_menu}
         end
    #    having trouble connecting level if that is what we should add as well. Thinking of putting it in a hash, 
    #    I dont know if that will affect sorting it alphabetically, but the names are sorted
    end
    

         def rearrage_party
        pokemonid = @@prompt.select("How would you like to sort your pokemon") do |menu|
            menu.choice "Alphabetically", -> {self.alphabetically}
            menu.choice "back", -> {self.main_menu}
            end
        end  

       
    

    # def request_trades
    #     trade = Trainer.all.map do |trainer|
    #         {trainer.name => trainer.id}
    #     end
    #         @@prompt.select("Who would you like to trade with", trade )
    # end
    end
end



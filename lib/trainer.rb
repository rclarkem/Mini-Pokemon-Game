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
            menu.choice "View Party", -> {self.view_party}
            menu.choice "Edit Party"
            menu.choice "View PokeDex"
            menu.choice "Request a Trade"
            menu.choice "Request a Battle"
            menu.choice "Log Out"
        end
    end

    def view_party
        self.reload
        sytem "clear"
        pokemon_i_own = Trainer.find(self.id).pokeballs.map do |pokemon|
            
        # pokemon_names = pokemon_i_own.map  {|pokemon| puts pokemon}
            # pokeball.trainer_id = self
        end
        # my_pokemon = pokemon_i_own.map do |pokeball|
        #     pokeball.pokemon_id
        # end
        # my_pokemon
    end

end
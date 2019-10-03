class Pokeball < ActiveRecord::Base
    belongs_to :pokemon
    belongs_to :trainer

    def self.starter_types
        arr = []
       arr << Pokemon.find_by(name: "Bulbasaur")
       arr << Pokemon.find_by(name: "Charmander")
       arr << Pokemon.find_by(name: "Squirtle")
    end

    def starter
        Pokeball.create(level: 5, trainer: trainer, pokemon: Pokemon.find( id ))
    end

end
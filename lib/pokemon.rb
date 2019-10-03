class Pokemon < ActiveRecord::Base
    has_many :pokeballs
    has_many :trainers, through: :pokeballs

    def self.starter_types
    arr = []
       arr << Pokemon.find_by(name: "Bulbasaur")
       arr << Pokemon.find_by(name: "Charmander")
       arr << Pokemon.find_by(name: "Squirtle")
    end



end
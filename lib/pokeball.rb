class Pokeball < ActiveRecord::Base
    belongs_to :pokemon
    belongs_to :trainer

   

    # def starter
    #     Pokeball.create(level: 5, trainer: trainer, pokemon: Pokemon.find( id ))
    # end

end
Trainer.destroy_all
Pokeball.destroy_all
Pokemon.destroy_all

ash = Trainer.create(name: "Ash", hometown: "Pallet Town")
may = Trainer.create(name: "May", hometown: "Newbark Town")

pikachu = Pokemon.create(name: "Pikachu", pokemon_type:"Electric")
charmander = Pokemon.create(name:"Charmander", pokemon_type:"Fire")
totodile = Pokemon.create(name: "Totodile", pokemon_type: "Water")
bulbasaur = Pokemon.create(name: "Bulbasaur", pokemon_type: "Grass")


pokeball_1 = Pokeball.create(level:6, trainer: may, pokemon: totodile)
pokeball_2 = Pokeball.create(level:6, trainer: ash, pokemon: bulbasaur)
pokeball_3 = Pokeball.create(level:6, trainer: ash, pokemon: totodile)
pokeball_4 = Pokeball.create(level:6, trainer: ash, pokemon: pikachu)
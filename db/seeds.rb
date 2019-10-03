Trainer.destroy_all
Pokeball.destroy_all
Pokemon.destroy_all

ash = Trainer.create(name: "Ash", hometown: "Pallet Town")
may = Trainer.create(name: "May", hometown: "Newbark Town")

pikachu = Pokemon.create(name: "Pikachu", pokemon_type:"Electric")
charmander = Pokemon.create(name:"Charmander", pokemon_type:"Fire")
totodile = Pokemon.create(name: "Totodile", pokemon_type: "Water")
bulbasaur = Pokemon.create(name: "Bulbasaur", pokemon_type: "Grass")
pidgey = Pokemon.create(name: "Pidgey", pokemon_type:"Flying")
rattatta = Pokemon.create(name: "Normal", pokemon_type:"Normal")
caterpie = Pokemon.create(name: "Caterpie", pokemon_type:"Bug")
snorlax = Pokemon.create(name: "Snorlax", pokemon_type:"Normal")
squirtle = Pokemon.create(name: "Squirtle", pokemon_type: "Water",)


pokeball_1 = Pokeball.create(level:6, trainer: may, pokemon: totodile)
pokeball_2 = Pokeball.create(level:6, trainer: ash, pokemon: bulbasaur)
pokeball_3 = Pokeball.create(level:6, trainer: ash, pokemon: totodile)
pokeball_4 = Pokeball.create(level:6, trainer: ash, pokemon: pikachu)
pokeball_5 = Pokeball.create(level:9, trainer: may, pokemon: caterpie)
pokeball_6 = Pokeball.create(level:10, trainer: may, pokemon: rattatta)
pokeball_7 = Pokeball.create(level:11, trainer: ash, pokemon: snorlax)
pokeball_8 = Pokeball.create(level:6, trainer: ash, pokemon: pidgey)

trade_1 = Trade.create(trade_initiator_id: ash, trade_target_id: may, traded_pokeball_id: pikachu)
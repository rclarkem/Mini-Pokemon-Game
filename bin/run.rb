require_relative '../config/environment'

ash = Trainer.create(name: "Ash", hometown: "Pallet Town")
may = Trainer.create(name: "May", hometown: "Newbark Town")

pikachu = Pokemon.create(name: "Pikachu", pokemon_type:"Electric")
charmander = Pokemon.create(name:"Charmander", pokemon_type:"Fire")
totadile = Pokemon.create(name: "Totadile", pokemon_type: "Water")


pokeball_2 = Pokeball.create(level:6, trainer_id: may.id, pokemon_id: totadile.id)

interface = Interface.new
interface.welcome()

binding.pry
puts "hello world"

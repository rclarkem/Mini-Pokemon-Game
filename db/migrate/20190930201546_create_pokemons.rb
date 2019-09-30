class CreatePokemons < ActiveRecord::Migration[5.2]
  def change 
    create_table :pokemons do |t|
      t.string :name
      t.string :pokemon_type
    end
  end
end

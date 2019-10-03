class AddNicknameToPokeballs < ActiveRecord::Migration[5.2]
  def change
    add_column :pokeballs, :nickname, :string
  end
end

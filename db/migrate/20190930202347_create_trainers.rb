class CreateTrainers < ActiveRecord::Migration[5.2]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :hometown
      t.integer :wallet, default: 1500
    end
  end
end

class CreateTrades < ActiveRecord::Migration[5.2]
  def change
    create_table :trades do |t|
      t.integer :trade_initiator_id
      t.integer :trade_target_id
      t.integer :traded_pokeball_id
    end
  end
end

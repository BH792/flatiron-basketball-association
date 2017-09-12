class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :position
      t.integer :ppg
      t.integer :rpg
      t.integer :apg
      t.integer :spg
      t.integer :bpg
    end
  end
end

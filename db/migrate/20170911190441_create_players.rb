class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :team_id
      t.string :position
      t.string :height
    end
  end
end

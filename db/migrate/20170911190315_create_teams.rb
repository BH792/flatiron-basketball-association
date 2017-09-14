class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.integer :user_id
      t.integer :wins, default: 0
      t.integer :losses, default: 0
    end
  end
end

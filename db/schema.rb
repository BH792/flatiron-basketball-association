

ActiveRecord::Schema.define(version: 20170912134726) do

  create_table "appearances", force: :cascade do |t|
    t.integer "points"
    t.integer "rebounds"
    t.integer "assists"
    t.integer "steals"
    t.integer "blocks"
    t.integer "game_id"
    t.integer "player_team_id"
  end

  create_table "games", force: :cascade do |t|
    t.datetime "date"
  end

  create_table "player_teams", force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "position"
    t.integer "ppg"
    t.integer "rpg"
    t.integer "apg"
    t.integer "spg"
    t.integer "bpg"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end

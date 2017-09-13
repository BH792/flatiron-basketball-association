players = [ "Álex Abrines",
  "Quincy Acy",
  "Steven Adams",
  "Bam Adebayo",
  "Arron Afflalo",
  "Lebron James",
  "Dirk Nowitzki",
  "Gordon Hayward"
]

players.each do |player|
  Player.create(
    name: player,
    position: "center",
    ppg: 10,
    rpg: 10,
    apg: 10,
    spg: 10,
    bpg: 10,
  )
end

user_emails = [
  "Jen@email.com",
  "Bob@email.com",
]

user_emails.each do |email|
  User.create(
    name: "Name",
    email: email,
    password: "apple"
  )
end

User.all.each do |user|
  team = Team.new(name: "First Team", user: user)
  team.players = Player.all[0,5]
  team.save
end

# 1.times do
#   Game.create(date: Time.now)
# end
#
# PlayerTeam.all.each do |pt|
#   Appearance.create(
#   points: 10,
#   rebounds: 10,
#   assists: 10,
#   steals: 10,
#   blocks: 10,
#   game: Game.all.first,
#   player_team: pt,
#   )
# end

# add up all appearance points that is the game score
# PlayerTeam.all.each do |pt|
#   Appearance.create(
#   points: pt.player.ppg * 0.20,
#   rebounds: 0,
#   assists: 0,
#   steals: 0,
#   blocks: 0,
#   game: Game.create(Time.now),
#   player_team: pt,
#   )
# end

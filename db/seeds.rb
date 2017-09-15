players = [
  "Bobby Huang",
  "Justin Manalad",
  "Logan Emerson",
  "Eugene DiBenedetto",
  "Lisa Hufnagel",
  "Sophie Helf",
  "Jil Krusemann",
  "Kevin Yonzon",
  "Suzy Cho",
  "Kenneth Jiang",
  "Natalie Perpepaj",
  "Marco Gaspari",
  "David He",
  "Ben Leavitt",
  "Kyle Vigorito",
  "Matthew Croak",
  "Gabriela Ferrara",
  "Yamini Kumawat",
  "Daniel Kushel",
  "Joshua Lacey",
  "Stacey Astoveza",
  "James Miele",
  "Jennifer Volpe",
  "Kenny Lin",
  "Tim Freeman",
  "Joe Cha",
  "Luke Glayat",
  "Matt Thorry",
  "Kesean Woodhouse",
  "Neil Steiner",
  "Hui Wang",
  "Gianpaul Rachiele",
  "Martina Weidenbaum",
  "Brigit Rossbach",
  "Isabelle Letaconnoux",
  "Roman Mulladzhanov",
  "Luis Arita",
  "Ethan Roberts",
  "Sho Miyata",
  "James Rhee",
  "Lauren Greenberg",
  "Tyler Knight",
  "Luke Pierotti",
  "Yura Choi",
  "Zack Wilder",
  "Andrew Schittone",
  "Zoey Kim",
  "Ben Coleman",
  "Jacob Lyon",
  "Marcella Maki",
  "Snigdha Sur",
  "Roman Johnson",
  "Carlos Almonte",
  "Jesse Tyner-Bryan",
  "Caitlin Keck",
  "Steven Balasta",
  "Yakov Kiffel",
  "Ivan Garcia",
  "Al Artesona",
  "Ashe Austaire",
  "Christina Pan",
  "Cole Shapiro",
  "Danielle Bennett",
  "Dave Goodman",
  "David Squires",
  "David Tannenbaum",
  "Daniel Seehausen",
  "Anna Bush",
  "Elbin Keeppanasseril",
  "Jon Openshaw",
  "Diego Dorado-Alvarado",
  "Matthew Gellert",
  "Lisa Hufnagel",
  "Natalie Dean",
  "Matthew Lawford",
  "Ian Shaw",
  "Ryan Sperzel",
  "Sikander Chowhan",
  "Ian Ramos",
  "Will Scripps",
  "Brooke Ryan",
  "Alex Griffith",
  "Maxwell Benton",
  "Rachel Salois",
]

players.each do |player|
  Player.create(
    name: player,
    position: ["Point guard", "Shooting guard", "Power forward"].sample,
    ppg: rand(0..30),
    rpg: rand(0..12),
    apg: rand(0..15),
    spg: rand(0..4),
    bpg: rand(0..4),
  )
end

Player.create(
  name: "Lauren Petersen",
  position: "Center",
  ppg: 999,
  rpg: 999,
  apg: 999,
  spg: 999,
  bpg: 999,
)

users = [
  "Jennifer",
  "Bobby",
  "Alex",
]

users.each do |name|
  User.create(
    name: name,
    email: "#{name}@email.com",
    password: "apple"
  )
end

User.all.each do |user|
  team = Team.new(name: "#{user.name}'s Team", user: user)
  team.players = Player.all.sample(5)
  team.save
end

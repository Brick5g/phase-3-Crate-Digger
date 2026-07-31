puts "Clearing existing data..."

Release.unscoped.delete_all
Artist.unscoped.delete_all

puts "Creating artists..."

cole = Artist.create!(
  name: "J. Cole",
  genre: "Hip-Hop",
  hometown: "Fayetteville"
)

kendrick = Artist.create!(
  name: "Kendrick Lamar",
  genre: "Hip-Hop",
  hometown: "Compton"
)

sade = Artist.create!(
  name: "Sade",
  genre: "Soul",
  hometown: "London"
)

puts "Creating releases..."

Release.create!(
  title: "2014 Forest Hills Drive",
  release_year: 2014,
  release_type: "Album",
  rating: 10,
  notes: "A complete album experience.",
  artist: cole
)

Release.create!(
  title: "The Off-Season",
  release_year: 2021,
  release_type: "Album",
  rating: 8,
  notes: "Focused and technically sharp.",
  artist: cole
)

Release.create!(
  title: "To Pimp a Butterfly",
  release_year: 2015,
  release_type: "Album",
  rating: 10,
  notes: "Dense, ambitious, and layered.",
  artist: kendrick
)

Release.create!(
  title: "good kid, m.A.A.d city",
  release_year: 2012,
  release_type: "Album",
  rating: 10,
  notes: "Strong storytelling and sequencing.",
  artist: kendrick
)

Release.create!(
  title: "The Best of Sade",
  release_year: 1994,
  release_type: "Compilation",
  rating: 9,
  notes: "A strong overview of the catalog.",
  artist: sade
)

puts "Seeding complete!"
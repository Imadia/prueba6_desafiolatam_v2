# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
a = User.create(name: "Ale", email: "ale@ale.cl")

5.times do |f|
	g = Genre.create(name: "Genre #{f}")
	s = Song.create(name: "Song #{f}", duration: 100*f, genre_id: g.id)
	u = UserSong.create(position: f, user_id: User.last, song_id: s.id)
end
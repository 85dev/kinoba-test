# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "START SEEDING DB"

User.destroy_all

def picture_picker
    randomizer = rand(200..300)
    picture_url = "https://picsum.photos/#{randomizer}"
end

def name_picker
    names = ['Jean', 'Michel', 'Edgar', 'Gaspard', 'Johan', 'Micheline', 'Albert', 'Clémentine', 'John']
    name = names.sample
end

def genders_selection
  genders_list = ['Character', 'Fantasy', 'History', 'Horror', 'Mystery', 'Animation', 'Romance', 'Sci-Fi', 'Thriller', 'Western']

  favorite_genders = []
  hated_genders = []

  until favorite_genders.length == 3 do
    gender = genders_list.sample
    unless favorite_genders.include?(gender)
      favorite_genders << gender
    end
  end

  until hated_genders.length == 1 do
    gender = genders_list.sample
    unless favorite_genders.include?(gender) && hated_genders.include?(gender)
      hated_genders << gender
    end
  end

  [favorite_genders, hated_genders]
end

def genders_id_selection
  genders_id = [12, 80, 26, 28, 18, 35, 36, 37, 53, 14, 16]
  3.times.map { genders_id.sample }
end

# Create a user
10.times do
    user = User.create(
    pseudo: name_picker,
    picture_url: picture_picker,
    favorite_genders: genders_selection[0],
    hated_genders: genders_selection[1],
    genders_id: genders_id_selection
    )
end

puts "SEEDS DONE"
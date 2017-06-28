# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Character.destroy_all

12.times do |index|
  character = Character.create!(name: Faker::HarryPotter.unique.character, location: Faker::HarryPotter.location)
  3.times do |index|
    character.reviews.create!(author: Faker::LordOfTheRings.character, body: Faker::Friends.quote)
  end

end

p "Created #{Character.count} characters"

p "Created #{Review.count} reviews"

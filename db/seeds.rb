# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Cleaning database..."
Cloth.destroy_all

puts "Creating cloths..."
10.times do
  cloth = Cloth.new(
    title: Faker::Lorem.word,
    description: Faker::Lorem.paragraph,
    category: ["Dress", "Suit", "Office"].sample,
    color: Faker::Color.color_name,
    brand: ["Gucci", "Prada", "Louis Vuitton", "Hermes", "Chanel"].sample,
    "start_date(1i)"=>"2022",
    "start_date(2i)"=>"4",
    "start_date(3i)"=>"13",
    "end_date(1i)"=>"2022",
    "end_date(2i)"=>"12",
    "end_date(3i)"=>"25",
    price: rand(1..20),
    user_id: 1
  )
  cloth.save
end

puts "Finished!"

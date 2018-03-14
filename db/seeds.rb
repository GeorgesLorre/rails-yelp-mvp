# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts 'dropping db'
Restaurant.destroy_all

puts 'reseeding'
10.times do
  resto = {
    name: Faker::Company.name,
    address: Faker::Simpsons.location,
    phone_number: Faker::Company.french_siren_number,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  }
  restaurant = Restaurant.new(resto)
  3.times do
    rev = {
      content: Faker::Hipster.paragraph,
      rating: rand(0..5)
    }
    review = Review.new(rev)
    review.restaurant = restaurant
    review.save
  end
  restaurant.save
end

puts 'done'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

# Seeds for User
user = User.new(email: 'vandita.attal@gmail.com', name: 'Vandita', password: '123456', address: 'first street')
user.save

# file = URI.open('https://pluspng.com/img-png/daredevil-hd-png-daredevil-png-hd-png-image-1977.png')

20.times {
    hero = Superhero.new(
      name: Faker::Superhero.name,
      superpower: Faker::Superhero.power,
      description: Faker::Superhero.descriptor,
      price: rand(50..200),
      user_id: user.id)
    hero.save
    # hero.photo.attach(io: file, filename: 'hero.png', content_type: 'image/png')
}

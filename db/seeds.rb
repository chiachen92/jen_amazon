# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  Category.create(name: Faker::Company.name)
end

10.times do
  Tag.create({name:Faker::GameOfThrones.house})
end

tags = Tag.all

50.times do
  Product.create({ title:      Faker::Company.catch_phrase,
                   description:  Faker::Hacker.say_something_smart,
                   tags: tags.sample(rand(3) + 1),
                   price: rand(1000) })
end

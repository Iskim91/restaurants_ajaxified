# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Destroying Ingredients"
  Ingredient.destroy_all

puts "Creating Ingredients"
ingredients = %w[Cucumber Basil Orange Salt Sugar Mint-leaves Ice Lemon-juice Orange-juice Lime Gin Tequila Bourbon Scotch Vodka Rum Passion-fruit Pineapple Whiskey Espresso Milk Condensed-milk Honey Champagne Soda Coke Sprite Ginger-beer Tomato-juice Ginger Vermouth Campari Tabasco Tonic Soy-sauce Worcestershire Horse-raddish]
ingredients.sort.each do |i|
  Ingredient.create(name: i)
end

puts "#{Ingredient.count} ingredients created"

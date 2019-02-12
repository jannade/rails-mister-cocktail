require 'json'
require 'open-uri'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredients_serialized = open(url).read
ingredients = JSON.parse(ingredients_serialized)

drinks = ingredients['drinks']

drinks.each do |i|
  drink_name = i['strIngredient1']
  Ingredient.create(name: drink_name)
end

dose1 = Dose.new(description: "10 ml", cocktail_id: 3, ingredient_id: 7)
dose1.save
dose2 = Dose.new(description: "50g ml", cocktail_id: 2, ingredient_id: 10)
dose2.save
dose3 = Dose.new(description: "10 ml", cocktail_id: 1, ingredient_id: 6)
dose3.save
dose4 = Dose.new(description: "10 ml", cocktail_id: 3, ingredient_id: 5)
dose4.save

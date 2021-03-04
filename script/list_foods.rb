def list_10_foods
  foods = Food.pluck(:nutrition)
  foods[0..9].each do |food|
    puts "food: #{food.inspect}"
  end
end

def check_json_response
  response = RestClient.get 'https://api.edamam.com/api/food-database/v2/parser?ingr=&app_id=592a7717&app_key=c4d981b34b013776df8cbbb041f03279'
  json = JSON.parse response

  puts "response: #{json}"
end

def all_food_names
  food_names = Food.pluck(:name)
  first_10_names = food_names[0..9]
  # first_10_names.each do |name|
    response = RestClient.get "https://api.edamam.com/api/food-database/v2/parser?ingr=#{food_names[0]}&category=generic-foods&app_id=592a7717&app_key=c4d981b34b013776df8cbbb041f03279"
    json = JSON.parse response

    if !json.nil? || !json.empty?
      puts "API result: #{json["parsed"][0]}\n\n"
    else
      puts "error seeding foods"
    end
  # end
end



# check_json_response
list_10_foods
# all_food_names

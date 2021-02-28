def list_10_foods
  foods = Food.limit(10)
  puts "total: #{Food.all.count}"
  foods.each do |food|
    puts "food: " + food[:name].to_s
  end
end

list_10_foods

def check_json_response
  response = RestClient.get 'https://api.edamam.com/api/food-database/v2/parser?ingr=&app_id=592a7717&app_key=c4d981b34b013776df8cbbb041f03279'
  json = JSON.parse response

  puts "response: #{json}"
end

# check_json_response

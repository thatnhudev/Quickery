require 'json'

def food
  name = ''
  response = RestClient.get "https://api.edamam.com/api/food-database/v2/parser?ingr=#{name}&category=generic-foods&app_id=592a7717&app_key=c4d981b34b013776df8cbbb041f03279"
  json = JSON.parse response

  if !json.nil? || !json.empty?
    json["parsed"].map do |food|
      Food.create!(name: "#{food[:label]}", group: "#{food[:category]}", calories: "#{food[:nutrients][:ENERC_KCAL].to_int}", image: "#{food[:image]}")
      puts "Food added - NAME: #{food[:label]}, GROUP: #{food[:category]}, CALORIES: #{food[:nutrients][:ENERC_KCAL].to_int}, IMAGE: #{food[:image]}"
    end
  else
    puts "error seeding foods"
  end
end

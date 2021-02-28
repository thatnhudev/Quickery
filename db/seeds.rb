require 'json'

# get nutritional data from Edamam API
def get_food_data
  # retrieve list of all food items that are missing nutritional info
  empty_foods = Food.where(calories: nil)
  food_names = []
  empty_foods.each do |food|
    food_names << food[:name]
  end

  # get API data by food/ingredient name
  food_names.each do |name|
    response = RestClient.get "https://api.edamam.com/api/food-database/v2/parser?ingr=#{name}&category=generic-foods&app_id=592a7717&app_key=c4d981b34b013776df8cbbb041f03279"
    json = JSON.parse response

    if (!json.nil? || !json.empty?)
      result = json["parsed"][0]
      next if result.nil?
      food = result["food"]
      calories = (food["nutrients"]["ENERC_KCAL"]).to_int
      nutrition = food["nutrients"]
      image = food["image"]

      # Find existing food record
      food_record = Food.find_by!(name: name)
      if !food_record.nil?
        if !(calories.nil? && nutrition.nil? && image.nil?)
          food_record.update!(calories: calories, nutrition: nutrition, image: image)
          puts "Food item successfully updated: #{name}"
        else
          puts "API Data not found for: #{name}"
        end
      else
        puts "Food record not found for: #{name}"
      end
    end
  end
end

get_food_data

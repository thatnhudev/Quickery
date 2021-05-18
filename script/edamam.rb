def get_food_from_edamam(food_list)
  puts "Total Foods to be parsed: #{food_list.length}"
  total_time = 0.seconds
  parsing_time = 0.seconds
  parsed_count = 0
  total_parsed = 0
  total_unparsed = []
  
  puts "Starting to parse foods from Edamam..."
  while food_list.length > 0
    food_name = food_list[0]
    puts "Parsing time elapsed: #{parsing_time}"
    if parsing_time < 60.seconds
      start_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      # rate limit = 10 requests per min
      if parsed_count < 10
        response = RestClient.get "https://api.edamam.com/api/food-database/v2/parser?ingr=#{food_name}&category=generic-foods&app_id=592a7717&app_key=c4d981b34b013776df8cbbb041f03279"
        json = (JSON.parse response)["parsed"]

        if !json.nil? && !json.empty?
          # update food item with edamam data
          puts "Parse successful. Updating food item: #{food_name}..."
          parsed_food = json[0]["food"]
          nutrition = parsed_food["nutrients"]
          calories = parsed_food["nutrients"]["ENERC_KCAL"]
          image = parsed_food["image"]

          food = Food.find_by(name: food_name)

          if !food.nil? && (!nutrition.nil? && !calories.nil? && !image.nil?)
            food.update(nutrition: nutrition, calories: calories, image: image)
            puts "Update complete!"
          else
            puts "Error! Food record was not found for: #{food_name}"
          end          
          # remove item from list
          food_list -= [food_name]

          # increment count
          parsed_count += 1
          total_parsed += 1

          # update time elapsed
          end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
          elapsed_time = end_time - start_time
          parsing_time += elapsed_time
          total_time += elapsed_time
          puts "API result: #{json[0]}\nTime spent: #{elapsed_time}\n\n"
        else
          puts "Unable to parse data for food item: #{food_name}.\n\n"
          food_list -= [food_name]
          total_unparsed += [food_name]
          end_time = Process.clock_gettime(Process::CLOCK_MONOTONIC)
          elapsed_time = end_time - start_time
          parsing_time += elapsed_time
          total_time += elapsed_time
        end
      else
        remaining_time = 60.seconds - parsing_time
        total_time += remaining_time
        puts "Rate Limit Reached! Sleeping for #{remaining_time} seconds..."
        sleep(remaining_time)
        puts "Resetting total time and parsed count..."
        parsing_time = 0.seconds
        parsed_count = 0
      end
    else
      puts "Something went wrong. Edamam is taking longer than usual to parse. Ending parsing..."
      break
    end
  end
  puts "------------------------------------------"
  puts "Parsing Complete!\nTotal Foods Parsed: #{total_parsed}\nTotal Foods Unparsed: #{total_unparsed.length}\nTotal Time Spent: #{'%.2f' % (total_time/60)} min"
  if total_unparsed.length > 0
    puts "One or more foods were unparsed:"
    total_unparsed.each do |unparsed|
      puts unparsed
    end
  end
end

# get_food_from_edamam()

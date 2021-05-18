def clean_nutrition
  foods = Food.where.not(nutrition: nil)
  total_updated = 0
  puts "Total food items found: #{foods.length}"

  if !foods.nil?
    foods.each do |food|
      if food.format_nutrition_data
        total_updated += 1
      end
    end

    if total_updated > 0
      puts "Update complete. Total food items updated: #{total_updated}"
    else
      puts "Update was unsuccessful."
    end
  end
end

def update_food_images
  foods = Food.where.not(group: nil)
  total_updated = 0
  puts "Total food items found: #{foods.length}"

  if !foods.nil?
    foods.each do |food|
      if food.update_images_by_group
        total_updated += 1
      end
    end

    if total_updated > 0
      puts "Update complete. Total food items updated: #{total_updated}"
    else
      puts "Update was unsuccessful."
    end
  end
end

clean_nutrition
#update_food_images

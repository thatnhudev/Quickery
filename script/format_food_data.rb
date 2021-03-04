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
      puts "Update successful. Total food items updated: #{total_updated}"
    else
      puts "Update was unsuccessful."
    end
  end
end

clean_nutrition

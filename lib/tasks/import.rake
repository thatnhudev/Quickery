require 'roo'

namespace :import do
  desc "Import data from Basic Grocery Items List"
  task data: :environment do
    puts "Importing Data from Spreadsheet"
    data = Roo::Spreadsheet.open('app/assets/BasicGroceryItems.xlsx')
    headers = data.row(1)

    data.each_with_index do |row, idx|
      next if idx == 0 # skip header
      # create hash from headers and cells
      food_data = Hash[[headers, row].transpose]
      if Food.exists?(name: food_data['name'])
        puts "Food with name '#{food_data['name']}' already exists"
        next
      end

      food = Food.new(food_data)
      food.save!
      puts "Food Item Saved: #{food.name}"
    end
  end
end

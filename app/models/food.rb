class Food < ApplicationRecord
  validates :name, length: { in: 0..50 }, presence: true
  validates :group, length: { in: 0..50 }, presence: true
  validates :category, length: { maximum: 50 }
  validates :nutrition, length: { maximum: 1000 }

  def format_nutrition_data
    self.reload
    # cleanup/formatting
    nutrition = self.nutrition.tr('{}','')
    nutrition = nutrition.tr('\"', '')
    nutrition = nutrition.gsub!(/=>/, ': ')
    nutrition = nutrition.titleize
    self.nutrition = nutrition
    if self.save!
      return true
    else
      return false
    end
  end

  def update_images_by_group
    self.reload
    group = self.group
    img_url = ""
    if group == "Vegetable"
      img_url == 'app/assets/images/vegicon.png'
    elsif group == "Fruit"
      img_url == 'app/assets/images/fruiticon.png'
    elsif group == "Meat"
      img_url == 'app/assets/images/meaticon.png'
    elsif group == "Bread" || group == "Grains"
      img_url == 'app/assets/images/grainsicon.png'
    elsif group == "Seafood"
      img_url == 'app/assets/images/seafoodicon.png'
    elsif group == "Nuts"
      img_url == 'app/assets/images/dairyicon.png'
    end
    self.image = img_url
    if self.save!
      return true
    else
      return false
    end
  end
end

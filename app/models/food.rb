class Food < ApplicationRecord
  validates :name, length: { in: 0..50 }, presence: true
  validates :group, length: { in: 0..50 }, presence: true
  validates :category, length: { maximum: 50 }
  validates :nutrition, length: { maximum: 1000 }

  def format_nutrition_data
    self.reload
    # remove unwanted characters & format to have proper casing
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
end

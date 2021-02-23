class Food < ApplicationRecord
  validates :name, length: { in: 0..50 }, presence: true
  validates :group, length: { in: 0..50 }, presence: true
  validates :type, length: { in: 0..50 }
  validates :nutrition, length: { in: 0..1000 }
  validates :calories, numericality: true, presence: true
end

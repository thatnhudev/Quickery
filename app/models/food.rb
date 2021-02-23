class Food < ApplicationRecord
  validates :name, length: { in: 0..50 }, presence: true
  validates :group, length: { in: 0..50 }, presence: true
  validates :category, length: { maximum: 50 }
  validates :nutrition, length: { maximum: 1000 }
end

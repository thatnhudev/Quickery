class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :group, null: false
      t.text :nutrition
      t.integer :calories, null: false
      t.text :type
      t.string :image, default: 'https://ibb.co/D4yfzXy'

      t.timestamps
    end
  end
end

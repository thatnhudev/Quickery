class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name, null: false
      t.string :group, null: false
      t.text :nutrition
      t.integer :calories
      t.text :category
      t.string :image

      t.timestamps
    end
  end
end

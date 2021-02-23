class ChangeCaloriesNullConstraint < ActiveRecord::Migration[6.1]
  def change
    change_column_null :foods, :calories, true
  end
end

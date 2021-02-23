class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :foods, :type, :category
  end
end

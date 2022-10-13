class RenameTypeToFoodType < ActiveRecord::Migration[5.2]
  def change
    rename_column :restaurants, :type, :food_type
  end
end

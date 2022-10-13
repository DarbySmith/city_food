class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :type
      t.boolean :alcohol_served
      t.integer :rating

      t.timestamp
    end
  end
end

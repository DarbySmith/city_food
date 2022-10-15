class City < ApplicationRecord
  has_many :restaurants

  def restaurant_count
    restaurants.size
  end
end
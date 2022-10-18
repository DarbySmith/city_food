class City < ApplicationRecord
  has_many :restaurants, :dependent => :destroy

  def restaurant_count
    restaurants.count
  end
end
class Party < ActiveRecord::Base
  has_many(:orders)
  has_many(:foods, :through => :orders)

  def sum
    prices = self.foods.map {|food| 
      food.price}
    prices.inject(:+)
  end

  # def display_sum
  #   self.sum
  #   self.sum.to_s
  # end

end
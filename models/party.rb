class Party < ActiveRecord::Base
  has_many(:orders)
  has_many(:foods, :through => :orders)

  class PartyAlreadyPaidError < StandardError
  end

  def error_if_paid
    if self.payment_complete == true
      raise PartyAlreadyPaidError, "*** This party has already paid ***"
    end
  end

  def sum
    prices = self.foods.map {|food| 
      food.price}
    prices.inject(:+)
  end

  def display_sum
    self.sum
    self.sum.to_s
  end

  def display_paid
    if self.payment_complete == true
      "YES"
    else
      "NO"
    end
  end

end
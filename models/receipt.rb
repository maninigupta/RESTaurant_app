class Receipt
  def initialize(foods)
    @foods = foods
  end

  def to_s
    receipt = ""
    receipt << title + "\n\n"
    receipt << food_lines + "\n\n"
    receipt << subtotal + "\n\n"
    receipt << suggested_tip
  end

  def title
    "Manini's Restaurant".center(30)
  end

  def food_lines
    formatted_foods = @foods.map do |food|
      food.name.to_s.ljust(20, '.') +
        formatted_price(food.price.to_s).rjust(10, '.')
    end
    formatted_foods.join("\n")
  end

  def subtotal
    "Subtotal".ljust(20, '.') +
    formatted_price("#{sum}").rjust(10, '.')
  end

  def formatted_price(price)
    dollars, cents = price.to_f.to_s.split('.')
    cents = cents.ljust(2, "0")
    [dollars, cents].join(".")
  end

  def sum
    prices = @foods.map {|food|
      food.price}
    prices.inject(:+)
  end

  def suggested_tip
    tip_suggestions = "Suggested Tip:\n"
    tip_suggestions << "Total + 10% = #{formatted_price(sum*1.1)}\n"
    tip_suggestions << "Total + 15% = #{formatted_price(sum*1.15)}\n"
    tip_suggestions << "Total + 20% = #{formatted_price(sum*1.2)}"
    # calculate
  end

end
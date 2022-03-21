require_relative "film"
require_relative "disc"
require_relative "book"

class Cart

  def initialize
    @cart = []
  end

  def <<(chosed_product)
    @cart = @cart + [chosed_product]
  end

  def sum
    @cart.sum(&:price)
  end

  def to_s
    @cart.tally.map.with_index(1){ |(product, count), i| "#{i}. #{product.to_s} В корзине: #{count}" }.join("\n")
  end
end

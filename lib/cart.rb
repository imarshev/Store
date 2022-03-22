class Cart
  def initialize
    @cart = []
  end

  def <<(chosed_product)
    @cart << chosed_product
  end

  def sum
    @cart.sum(&:price)
  end

  def to_s
    @cart.tally.map.with_index(1){ |(product, count), i| "#{i}. #{product.to_s} В корзине: #{count}" }.join("\n")
  end
end

class Product
  attr_accessor :price, :amount

  def self.from_file(path)
    raise NotImplementedError
  end

  def initialize(hash)
    @price = hash[:price]
    @amount = hash[:amount]
  end

  def to_s
    "#{@price} руб. (в магазине: #{@amount})"
  end

  def reduce_amount
    @amount -= 1
  end
end

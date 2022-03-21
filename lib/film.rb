require_relative "product"

class Film < Product
  attr_accessor :name, :year, :director

  def initialize(hash)
    super
    @name = hash[:name]
    @year = hash[:year]
    @director = hash[:director]
  end

  def self.from_file(path)
    lines = File.readlines(path).map { |line| line.chomp }
    self.new(
      name: lines[0],
      director: lines[1],
      year: lines[2].to_i,
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def to_s
    "Фильм: #{@name}, #{@year}, реж. #{@director}, " + super
  end
end

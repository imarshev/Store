require_relative "product"

class Disc < Product
  attr_accessor :name, :genre, :author

  def initialize(hash)
    super
    @name = hash[:name]
    @genre = hash[:genre]
    @author = hash[:author]
    @year = hash[:year]
  end

  def self.from_file(path)
    lines = File.readlines(path).map { |line| line.chomp }
    self.new(
      name: lines[0],
      author: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4].to_i,
      amount: lines[5].to_i
    )
  end

  def to_s
    "Альбом: #{@name} — #{author}, #{@genre},  " + super
  end
end

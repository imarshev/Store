require_relative "product"

class Book < Product
  attr_accessor :name, :genre, :author

 def initialize(hash)
    super
    @name = hash[:name]
    @genre = hash[:genre]
    @author = hash[:author]
  end

  def self.from_file(path)
    lines = File.readlines(path).map { |line| line.chomp }
    self.new(
      name: lines[0],
      genre: lines[1],
      author: lines[2],
      price: lines[3].to_i,
      amount: lines[4].to_i
    )
  end

  def to_s
    "Книга: #{@name}, #{@genre}, автор — #{@author}, " + super
  end
end

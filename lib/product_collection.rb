require_relative "film"
require_relative "disc"
require_relative "book"

class ProductCollection
  attr_reader :collection

  PRODUCT_TYPES = [
    {dir: "books", class: Book},
    {dir: "films", class: Film},
    {dir: "discs", class: Disc},
  ]

  def initialize(collection)
    @collection = collection
  end

  def self.from_dir(dir_path)
    collection = []
    PRODUCT_TYPES.each do |type|
      Dir.glob(File.join(dir_path, type[:dir], "*.txt")).each do |file_path|
        collection << type[:class].from_file(file_path)
      end
    end
    new(collection)
  end

  def purchase(chosed_product)
    chosed_product.reduce_amount
    @collection = @collection - [chosed_product] if chosed_product.amount == 0
  end

  def size
    @collection.size
  end

  def product_by_index(index)
    @collection[index - 1]
  end

  def to_s
    @collection.map.with_index(1){ |product, i| "#{i}. #{product}" }.join("\n")
  end

  def to_a
    @collection
  end

  def sort!(terms)
    case terms[:sort_by]
    when :name then @collection.sort_by!(&:name)
    when :amount then @collection.sort_by!(&:amount)
    when :price then @collection.sort_by!(&:amount)
    end
    @collection.reverse! if terms[:order] == :desc
  end
end

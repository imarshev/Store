class ProductCollection
  attr_reader :collection

  def initialize(collection)
    @collection = collection
  end

  def self.from_dir
    file_paths = Dir.glob(File.join(__dir__,"..","data","**","*.txt"))
    collection = file_paths.map { |file_path|
      case file_path.match(/(films|books|discs)/).to_s
      when "films" then Film.from_file(file_path)
      when "books" then Book.from_file(file_path)
      when "discs" then Disc.from_file(file_path)
      end
    }
    self.new(collection)
  end

  def to_a
    @collection
  end

  def sort(terms)
    case terms[:sort_by]
    when :name then @collection.sort_by! { |product| product.name }
    when :amount then @collection.sort_by! { |product| product.amount }
    when :price then @collection.sort_by! { |product| product.price }
    end
    @collection.reverse! if terms[:order] == :desc
  end
end

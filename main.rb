require_relative "lib/product"
require_relative "lib/product_collection"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disc"

counter = ProductCollection.from_dir(File.join(__dir__, "data"))


# collection.sort(sort_by: :price, order: :asc) #sort_by: name, price, amount. order: asc, desc

puts "❓ Что хотите купить:"
puts counter
puts "0. Выход"

basket = ProductCollection.new([])

users_choice = gets.to_i

until users_choice == 0 || counter.collection.size == 0 do

  until users_choice.between?(0, counter.collection.size) do
    puts "Нет товара с таким артикулом. Выбери вариант от 1 до #{counter.size}"
    users_choice = gets.to_i
  end

  chosed_product = counter.collection[users_choice-1]

  counter.take!(chosed_product)
  basket.put!(chosed_product)

  puts "Вы выбрали: #{chosed_product}"

  puts "💰 Всего товаров на сумму: #{basket.sum}"

  unless counter.collection.size == 0
    puts "❓ Что ещё хотите купить?"
    puts counter
    puts "0. Выход"

    users_choice = gets.to_i
  end
end

puts "🗑 Вы купили:"
puts basket
puts "С вас #{basket.sum} руб. Спасибо за покупки!"

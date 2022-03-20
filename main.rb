require_relative "lib/product"
require_relative "lib/product_collection"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disc"

collection = ProductCollection.from_dir

# collection.sort(sort_by: :price, order: :asc) #sort_by: name, price, amount. order: asc, desc

puts "❓ Что хотите купить:"

counter = collection.to_a

counter.each_with_index { |product, i| puts "#{i+1}. #{product}"}
puts "0. Выход"

basket = []

users_choice = nil

until users_choice == 0 || counter.size == 0 do
  users_choice = gets.to_i

  until users_choice.between?(0, counter.size) do
    puts "Нет товара с таким артикулом. Выбери вариант от 1 до #{counter.size}"
    users_choice = gets.to_i
  end

  chosed_product = counter.slice!(users_choice-1, 1)[0]
  basket << chosed_product

  puts "Вы выбрали: #{chosed_product}"
  sum = 0
  basket.each { |product| sum += product.price }
  puts "💰 Всего товаров на сумму: #{sum}"

  puts "❓ Что ещё хотите купить?"
  counter.each_with_index { |product, i| puts "#{i+1}. #{product}"}
  puts "0. Выход"
end

puts "🗑 Вы купили:"
basket.each_with_index { |product, i| puts "#{i+1}. #{product}"}
puts "С вас #{sum} руб. Спасибо за покупки!"

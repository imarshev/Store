require_relative "lib/product_collection"
require_relative "lib/cart"

collection = ProductCollection.from_dir(File.join(__dir__, "data"))
cart = Cart.new

until collection.size.zero? do
  puts "❓ Что хотите купить?"
  puts collection
  puts "0. Выход"
  users_choice = gets.to_i

  until users_choice.between?(0, collection.size) do
    puts "Нет товара с таким артикулом. Выбери вариант от 1 до #{collection.size}"
    users_choice = gets.to_i
  end

  break if users_choice.zero?

  chosed_product = collection.product_by_index(users_choice)
  collection.purchase(chosed_product)
  cart << chosed_product
  puts "Вы выбрали: #{chosed_product}"
  puts "💰 Всего товаров на сумму: #{cart.sum}"
end

puts "🗑 Вы купили:"
puts cart
puts "С вас #{cart.sum} руб. Спасибо за покупки!"

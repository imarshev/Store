require_relative "lib/product_collection"
require_relative "lib/cart"
require_relative "lib/book"
require_relative "lib/film"
require_relative "lib/disc"

shop = ProductCollection.from_dir(File.join(__dir__, "data"))
cart = Cart.new

users_choice = nil

until users_choice == 0 || shop.collection.size == 0 do

  unless shop.collection.size == 0
    puts "❓ Что хотите купить?"
    puts shop
    puts "0. Выход"
    users_choice = gets.to_i
  end

  until users_choice.between?(0, shop.collection.size) do
    puts "Нет товара с таким артикулом. Выбери вариант от 1 до #{shop.collection.size}"
    users_choice = gets.to_i
  end

  unless users_choice == 0
    chosed_product = shop.collection[users_choice-1]
    shop >> chosed_product
    cart << chosed_product
    puts "Вы выбрали: #{chosed_product}"
    puts "💰 Всего товаров на сумму: #{cart.sum}"
  end
end

puts "🗑 Вы купили:"
puts cart
puts "С вас #{cart.sum} руб. Спасибо за покупки!"

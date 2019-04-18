goods_name = ""
goods_hash = {}
sum = 0
total_price = 0
loop do
  puts "Введите название товара, для окончания ввода введите #{"стоп"}"
  goods_name = gets.chomp.capitalize!
  break if goods_name == "Стоп"
  puts "Введите цену товара"
  goods_price = gets.to_f
  puts "Введите количество товара"
  goods_qty = gets.to_i
  goods_hash[goods_name] = {goods_price => goods_qty}
end

goods_hash.each {|name, price_hash|
  price_hash.each {|price, qty| sum = price * qty}
    puts "Товар: #{name}, цена за эту позицию: #{sum}"
    total_price += sum
}
puts "Сумма покупок: #{total_price}"

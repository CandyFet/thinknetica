goods_hash = {}
total = 0
loop do
  puts "Введите название товара, для окончания ввода введите #{"стоп"}"
  goods_name = gets.chomp.capitalize!
  break if goods_name == "Стоп"
  puts "Введите цену товара"
  goods_price = gets.to_f
  puts "Введите количество товара"
  goods_qty = gets.to_i
  goods_hash[goods_name] = {price: goods_price, quantity: goods_qty}
end

goods_hash.each do|name, info|
  item_total = info[:price] * info[:quantity]
  total += item_total
  puts "Товар: #{name}, цена за эту позицию: #{item_total}"
end
puts "Сумма покупок: #{total}"

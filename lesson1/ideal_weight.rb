puts "Введите Ваше имя"
name = gets.chomp.capitalize!
puts "Введите Ваш рост"
height = gets.to_i
weight = height - 110
if weight < 0
  puts "#{name}, Ваш вес уже идеальный"
else
  puts "#{name}, Ваш идеальный вес #{weight}"
end

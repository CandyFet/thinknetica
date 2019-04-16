puts "Введите высоту треугольника"
height = gets.chomp.to_f
while height < 0
  puts "Введите неотрицательную высоту треугольника"
  height = gets.chomp.to_f
end

puts "Введите основание треугольника"
a = gets.chomp.to_f
while a < 0
  puts "Введите неотрицательное основание треугольника"
  a = gets.chomp.to_f
end
puts "Площадь треугольника равна #{0.5*height*a}"

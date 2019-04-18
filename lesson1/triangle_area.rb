puts "Введите высоту треугольника"
height = gets.to_f
while height < 0
  puts "Введите неотрицательную высоту треугольника"
  height = gets.to_f
end

puts "Введите основание треугольника"
base = gets.to_f
while a < 0
  puts "Введите неотрицательное основание треугольника"
  a = gets.to_f
end
area = 0.5 * height * base
puts "Площадь треугольника равна #{area}"

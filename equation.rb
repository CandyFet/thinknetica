puts "Введите коэффициент a"
a = gets.to_f
puts "Введите коэффициент b"
b = gets.to_f
puts "Введите коэффициент c"
c = gets.to_f
d = b**2 - 4 * a * c
if d < 0
  puts "Корней нет!"
elsif d = 0
  x = -b / (2 * a)
  puts "Уравнение имеет один корень #{x}"
elsif d > 0
  x1 = (-b + Math.sqrt(d)) / (2.0 * a)
  x2 = (-b - Math.sqrt(d)) / (2.0 * a)
  puts "Уравнение имеет два корня #{x1} и #{x2}"
end

puts "Введите коэффициент a"
a = gets.chomp.to_f
puts "Введите коэффициент b"
b = gets.chomp.to_f
puts "Введите коэффициент c"
c = gets.chomp.to_c
d = b**2 - 4*a*c
if d < 0
  puts "Корней нет!"
elsif d = 0
  x = b*-1/(2*a)
  puts "Уравнение имеет один корень #{x}"
elsif d > 0
  x1 = (b*-1 + Math.sqrt(d)) / (2*a)
  x2 = (b*-1 - Math.sqrt(d)) / (2*a)
  puts "Уравнение имеет два корня #{x1} и #{x2}"
end  

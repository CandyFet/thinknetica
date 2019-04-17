sides_array = []
puts "Введите первую сторону треуголника"
sides_array << gets.to_f
puts "Введите вторую сторону треугольника"
sides_array << gets.to_f
puts "Введите третью сторону треуголника"
sides_array << gets.to_f
cathetus1, cathetus2, hypotenuse = sides_array.sort!
right_triangle = cathetus1**2 + cathetus2**2 == hypotenuse**2
if cathetus1 == cathetus2 && cathetus1 == hypotenuse
  puts "Треугольник равнобедренный и равносторонний, но не прямоугольный"
elsif cathetus1 == cathetus2 && right_triangle
  puts "Треугольник равнобедренный и прямоугольный"
elsif right_triangle
  puts "Треугольник прямоугольный"
end

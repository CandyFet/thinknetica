sides_array = []
puts "Введите первую сторону треуголника"
first_side = gets.chomp.to_f
sides_array << first_side
puts "Введите вторую сторону треугольника"
second_side = gets.chomp.to_f
sides_array << second_side
puts "Введите третью сторону треуголника"
third_side = gets.chomp.to_f
sides_array << third_side
max_side = sides_array.max
sides_array.delete(max_side)
if sides_array.length == 0
  puts "Треугольник равнобедренный и равносторонний, но не прямоугольный"
elsif sides_array[0] == sides_array[1] && max_side == Math.sqrt((sides_array[0]**2) * 2)
  puts "Треугольник равнобедренный и прямоугольный"
elsif max_side == Math.sqrt((sides_array[0]**2) + (sides_array[1]**2))
  puts "Треугольник прямоугольный"
end

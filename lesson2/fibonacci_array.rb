fibonacci_array = [0, 1]
fibonacci_integer = 1
while fibonacci_integer < 100
  fibonacci_integer = fibonacci_array[-1] + fibonacci_array[-2]
  fibonacci_array << fibonacci_integer
end
puts fibonacci_array

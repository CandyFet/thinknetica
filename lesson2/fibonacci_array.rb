fibonacci_array = [0,1]
i = 2
while i < 100
  fibonacci_integer = fibonacci_array[i-1] + fibonacci_array[i-2]
  fibonacci_array << fibonacci_integer
  i += 1
end
puts fibonacci_array

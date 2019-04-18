puts "Введите год"
year = gets.to_i
month_array = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
while year < 0
  puts "Введите неотрицательное значение"
  year = gets.to_i
end
leap_year = year % 4 == 0 && year % 100 != 0 || year % 400 == 0
month_array[1] = 29 if leap_year
puts "Введите номер месяца"
month = gets.to_i
until month.between?(1, 12)
  puts "Введите номер месяца в интервале от 1 до 12"
  month = gets.to_i
end
puts "Введите число месяца"
day = gets.to_i
until day.between?(1, month_array[month - 1])
  puts "Введите число в интервале от 1 до #{month_array[month - 1]}"
  day = gets.to_i
end
sum_of_days_in_month = month_array.take(month - 1).sum
amount_of_days = sum_of_days_in_month + day
puts "Введенная дата является #{amount_of_days} днем года"

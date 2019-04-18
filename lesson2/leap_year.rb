puts "Введите год"
year = gets.to_i
while year < 0
  puts "Введите неотрицательное значение"
  year = gets.to_i
end
leap_year = year % 4 == 0 && year % 100 || year % 400 == 0
if leap_year
  month_hash = {
  1 => 31,
  2 => 29,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31}
else
  month_hash = {
  1 => 31,
  2 => 28,
  3 => 31,
  4 => 30,
  5 => 31,
  6 => 30,
  7 => 31,
  8 => 31,
  9 => 30,
  10 => 31,
  11 => 30,
  12 => 31}
end
puts "Введите номер месяца"
month = gets.to_i
while month > 12 || month < 1
  puts "Введите номер месяца в интервале от 1 до 12"
  month = gets.to_i
end
puts "Введите число месяца"
day = gets.to_i
while day > month_hash[month] || day < 1
  puts "Введите число в интервале от 1 до #{month_hash[month]}"
  day = gets.to_i
end
amount_of_days = 0
(1..month).each {|month_in_each|
if month_in_each == month
  amount_of_days += day
else
  amount_of_days += month_hash[month_in_each]
end
}

puts "Введенная дата явлется #{amount_of_days} днем года"

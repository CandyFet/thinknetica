chars_array = ('a'..'z').to_a
vowels_array = ['a', 'e', 'i', 'o', 'u']
vowels_hash = Hash.new
chars_array.each {|char|
vowels_hash[char] = chars_array.index(char) + 1 if vowels_array.include?(char)
}
puts vowels_hash

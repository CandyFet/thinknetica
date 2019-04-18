alphabet = ('a'..'z')
vowels_array = %w[a e i o u]
vowels_hash = {}
alphabet.each.with_index(1) do |letter, index|
  vowels_hash[letter] = index if vowels_array.include?(letter)
end
puts vowels_hash

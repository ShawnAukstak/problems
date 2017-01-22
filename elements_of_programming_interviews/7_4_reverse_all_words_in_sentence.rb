#input: "Alice likes Bob"
#output: "Bob likes Alice"


#O(n) O(n) where n is the number of characters, if do split(' ') to create array, then reverse it, e.g.:
#string.split(' ').reverse!.join(' ')
#O(n) #O(1) #reverse string in place, then revesre ever word

def reverse_words_in_sentence(string)
  reverse_characters(0, string.length - 1, string)

  left = 0
  string.chars.each_with_index do |c, i|
    if c == " "
      reverse_characters(left, i - 1, string)
      left = i + 1
    end
  end

  #reverse last word
  reverse_characters(left, string.length - 1, string)
end

def reverse_characters(left, right, string)
  while (left < right)
    string[left], string[right] = string[right], string[left]
    left += 1
    right -= 1
  end
end

string = "Alice likes Bob"

puts string
reverse_words_in_sentence(string)
puts string



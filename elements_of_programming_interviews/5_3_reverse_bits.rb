
#reverse bits
#110
#011

def reverse_bits(word)
  left, right = 0, word.bit_length - 1

  while left < right
    swap_bits(left, right, word)
    left += 1
    right -= 1
  end

  word
end

def swap_bits(a, b, word)
    word[left], word[right] = word[right], word[left]
end

puts reverse_bits(6)
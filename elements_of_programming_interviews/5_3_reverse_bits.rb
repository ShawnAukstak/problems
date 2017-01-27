
#reverse bits
#110
#011

def reverse_bits_brute(word)
  left, right = 0, word.bit_length - 1

  while left < right
    word = swap_bits(left, right, word)
    left += 1
    right -= 1
  end

  word
end

def swap_bits(a, b, word)
  #Only swap if they are not equal
  if (word >> a) & 1 != (word >> b) & 1

    #They differ - only need to swap them
    word ^= ((1 << a) | (1 << b))
  end
  word
end

x = 6
puts x.to_s(2)
puts reverse_bits_brute(x).to_s(2)

#This can be done much more efficiently O(1) runtime if we created a hash or store,
#Such that that key is a 16 bit word, and the value is the 16 bit word reversed.

#input integer
#output reversed integer
#42 => 24
#-314 => -413

#O(n) where n is number of digits

def reverse_integer(k)
  reversed_k , negative = 0, k.negative?
  k = k.abs

  while(k > 0)
    reversed_k = reversed_k * 10 + k % 10
    k /= 10
  end

  (negative) ? -reversed_k : reversed_k
end

puts reverse_integer(42)
puts reverse_integer(-314)


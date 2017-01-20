

#input 64bit value
#output 1/0 for bit parity
#1 means even number of 1s
def bit_parity(word)
  one_total = word % 2

  for i in 1..63
    word >>= 1
    one_total += word % 2
  end

  puts one_total
  (one_total % 2 == 0) ? 1 : 0
end

puts bit_parity(7)
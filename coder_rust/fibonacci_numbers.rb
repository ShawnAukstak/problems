#Find the nth fibonacci number.
#0 1 1 2 3 5 8 13 21 34
def find_nth_fibonacci_number(n)
  return 0 if n == 0
  return 1 if n == 1

  addends = [0,1]
  find_fibonacci_number_rec(n,1,addends)

  return addends[1]
end

def find_fibonacci_number_rec(n, pos, addends)
  return if n == pos

  sum = addends[0] + addends[1]
  addends[0] = addends[1]
  addends[1] = sum

  find_fibonacci_number_rec(n, pos + 1, addends)
end

puts "0 #{find_nth_fibonacci_number(0)}"
puts "1 #{find_nth_fibonacci_number(1)}"
puts "1 #{find_nth_fibonacci_number(1)}"
puts "2 #{find_nth_fibonacci_number(2)}"
puts "3 #{find_nth_fibonacci_number(3)}"
puts "5 #{find_nth_fibonacci_number(5)}"
puts "8 #{find_nth_fibonacci_number(8)}"
puts "13 #{find_nth_fibonacci_number(13)}"
puts "21 #{find_nth_fibonacci_number(21)}"
puts "34 #{find_nth_fibonacci_number(34)}"
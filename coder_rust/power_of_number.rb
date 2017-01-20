def power_of_number_naive(x, n)
  result = 1

  for i in 1..n
    result *= x
  end

  return result
end

#Note - this is O(n)
#There is a way to do this using divide and conquer at O(Log n)
def power_of_number(x, n)
 return 1 if n == 0
 return x if n == 1

 return power_of_number(x, n - 1) * x
end

x = 3
n = 3

puts "#{x} #{n} #{x**n}"
puts "#{x} #{n} #{power_of_number(x, n)}"

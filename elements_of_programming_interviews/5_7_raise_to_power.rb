#given x float/double, and y integer.. return x^y
#O(n) where n = y
def raise_to_power_brute(x, y)
  result = x

  while y > 1
    result *= x
    y -= 1
  end

  result
end

#3^3 = 27
#4^2 = 16
def raise_to_power(x, y)
  #every shift left is like a * 2
  #11000
end

puts raise_to_power_brute(3, 3)
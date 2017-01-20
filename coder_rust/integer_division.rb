def integer_division_naive(a, b)
  count = 0
  sum = b

  until sum > a
    sum += b
    count += 1
  end

  return count
end

def integer_division(x, y)
  return -1 if y == 0

  if y > x
    return 0
  end

  if y == 1
    return x
  end

  if x == y
    return 1
  end

  q = 1
  val = y

  until val >= x
    val = val << 1
    q = q << 1
  end

  if val > x
    val = val >> 1
    q = q >> 1
    return q + integer_division(x - val, y)
  end

  return q
end

puts "7 / 2 = #{integer_division_naive(7, 2)}"
puts "5 / 4 = #{integer_division_naive(5, 4)}"
puts "1 / 3 = #{integer_division_naive(1, 3)}"

puts "7 / 2 = #{integer_division(7, 2)}"
puts "5 / 4 = #{integer_division(5, 4)}"
puts "1 / 3 = #{integer_division(1, 3)}"
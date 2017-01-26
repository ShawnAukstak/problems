require 'pp'

#Use arrays to do grade school multiplication.
#O(nm)
def big_product(x,y)
  results = Array.new(x.length + y.length, 0)

  if x[0] == '-'
    is_negative = true
    x.slice!(0,1)
  end

  if y[0] == '-'
    is_negative = !is_negative
    y.slice!(0,1)
  end

  #Multiply a number, creating array of result (apply position e.g. 10 to result)
  (x.length - 1).downto(0).each_with_index do |a, i|

    x_operand = x[a].ord - '0'.ord

    (y.length - 1).downto(0).each_with_index do |b, j|
      y_operand = y[b].ord - '0'.ord

      product = x_operand * y_operand
      results[i + j] += product
      results[i + j + 1] += results[i + j] / 10
      results[i + j] %= 10
    end
  end

  result = ""

  #Go through digit through digit, add them up for each place.
  index = results.length - 1
  while (results[index] == 0 && index != 0)
    index -= 1
  end

  #Prevent -0
  if is_negative && results[index] != 0
    result << "-"
  end

  index.downto(0).each do |i|
    result << results[i].to_s
  end

  result
end

x = "-11"
y = "0"
puts big_product(x, y)
puts x.to_i * y.to_i

x = "11"
y = "230"
puts big_product(x, y)
puts x.to_i * y.to_i

 x = "193707721"
 y = "-761838257287"

puts big_product(x, y)
puts x.to_i * y.to_i

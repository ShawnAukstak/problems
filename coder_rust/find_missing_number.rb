def find_missing_number(array)
  # total_sum = 1.upto(array.length + 1).inject { |x, total| x + total }
  actual_sum = array.inject { |x, total| x + total }
  n = array.length + 1
  total_sum = (n * (n + 1)) / 2

  return total_sum - actual_sum
end

array = [3,7,1,2,8,4,5]
puts "#{find_missing_number(array)}"
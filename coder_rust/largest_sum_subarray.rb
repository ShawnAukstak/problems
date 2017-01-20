#Given an array, find the sum of the largest contiguous subarray with the largest sum.
#maximum contiguous sum
def max_contiguous_sum_subarray(array)
  return if array.size == 0

  max_sum = array[0]
  current_max_sum = max_sum

  for i in 1..(array.size - 1)
    if current_max_sum < 0
      current_max_sum = array[i]
    else
      current_max_sum += array[i]
    end

    if current_max_sum > max_sum
      max_sum = current_max_sum
    end
  end

  return max_sum
end

#Given an array, find the largest contiguous subarray with the largest sum.
#Actually returns the subarray
def largest_sum_subarray(array)
  return if array.size == 0

  max_sum = array[0]
  current_max_sum = max_sum
  global_start = 0
  global_end = 0
  current_start = 0

  for i in 1..(array.size - 1)
    if current_max_sum < 0
      current_start = i
      current_max_sum = array[i]
    else
      current_max_sum += array[i]
    end

    if current_max_sum > max_sum
      max_sum = current_max_sum
      global_start = current_start
      global_end = i
    end
  end

  return array[global_start, global_end - global_start + 1]
end

array = [-4, 2, -5, 1, 2, 3, 6, -5, 1]
puts max_contiguous_sum_subarray(array)
puts largest_sum_subarray(array)
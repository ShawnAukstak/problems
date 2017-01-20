#we need to use the power of binary sort.
#The key is to not escape at equals, but rather once there is nothing left to divide, then if equal, return -1


def find_high_index(array, key)
  low = 0
  high = array.size - 1
  mid = (high / 2).floor

  while low <= high
    if array[mid] > key
      high = mid - 1
    elsif array[mid] <= key
      low = mid + 1
    end

    mid = low + ((high - low) / 2).floor
  end

  if array[high] == key
    return high
  else
    return -1
  end
end

def find_low_index(array, key)
  low = 0
  high = array.size - 1
  mid = (high / 2).floor

  while low <= high
    if array[mid] >= key
      high = mid - 1
    elsif array[mid] < key
      low = mid + 1
    end

    mid = low + ((high - low) / 2).floor
  end

  if array[low] == key
    return low
  else
    return -1
  end
end

#Assumed sorted array with duplicates.  Can be in the millions
array = [1, 2, 5, 5, 5, 5, 5, 5, 5, 5, 20]

key = 1
puts "key: #{key}, Low =#{find_low_index(array, key)} and High=#{find_high_index(array, key)}"

key = 2
puts "key: #{key}, Low =#{find_low_index(array, key)} and High=#{find_high_index(array, key)}"

key = 5
puts "key: #{key}, Low =#{find_low_index(array, key)} and High=#{find_high_index(array, key)}"

key = 20
puts "key: #{key}, Low =#{find_low_index(array, key)} and High=#{find_high_index(array, key)}"

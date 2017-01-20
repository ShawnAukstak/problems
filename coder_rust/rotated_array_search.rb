#array is sorted array
#rotations is the number of times to rotate the array
#find is the value to look for, return it's index or -1 if not found
def search_and_rotate_array(array, rotations, num)
  found_index = binary_search(array,num)

  return found_index if found_index < 0

  if found_index > (array.size - 1 - rotations)
    #It was on a portion rotated back to the start
    return found_index - (array.size - rotations)
  else
    #It was on a portion not rotated back around
    return found_index + rotations
  end
end

def binary_search(array, num)

  low = 0
  high = array.size - 1

  while(low <= high)
    mid = low + ((high - low) / 2)

    if array[mid] == num
      return mid
    end

    if array[mid] > num
      high = mid - 1
    else
      low = mid + 1
    end
  end

  return - 1
end

#Finds an index of already arbitrary rotated array
def binary_search_rotated(array, num)
  low = 0
  high = array.size - 1

  while(low <= high)
    mid = low + ((high - low) / 2)

    if array[mid] == num
      return mid
    end

    #Found out which side is unsorted, and see if other number is in the sorted half.
    #If not in either sorted halves, then look in the unsorted side.

    if array[high] < array[mid] && num < array[mid] && num >= array[low]
      #Right half is unsorted.. and our number is in the left, sorted half.
      high = mid - 1
    elsif array[mid] < array[low] && num > array[mid] && num <= array[high]
      #Left half is unsorted.. and our number is in the right, sorted half.
      low = mid + 1
    elsif array[high] > array[mid]
      #Right half if sorted, go left.
      high = mid - 1
    elsif array[low] < array[mid]
      #Left half is sorted, go right.
      low = mid + 1
    end
  end

  return - 1
end

# find 6
# [100, 200, 300, 400, 600, 6, 9, 10]

array = [1, 10, 20, 47, 59, 63, 75, 88, 99, 107, 120, 133, 155, 162, 176, 188, 199, 200, 210, 222]
rotations = 10
find = 222

puts "Rotate #{rotations} times and find #{find} at #{search_and_rotate_array(array, rotations, find)}"

rotations.times do
  array.unshift(array.pop)
end

puts "Rotate #{rotations} times and find #{find} at #{binary_search_rotated(array, find)}"

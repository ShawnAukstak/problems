#Given an interger array, move all elements to the left while maintaining order of all other elements.

#We go linear, and go through the array and create an array of zero indexes.
#Then go through the array, and swap out with each value that is not a zero.

def move_zeros_left_failure(array)
  zero_indexes = Array.new

  array.each_with_index do |value, index|
    if value == 0
      zero_indexes << index
    end
  end

  zeros_cursor = 0
  zero_indexes.each do |index|

    #This does not work, because we're swapping.. NOT maintaining order.
    #If this index is not in a place that will eventually be a zero.
    unless index < zero_indexes.size - 1
      tmp = array[index]
      array[index] = array[zeros_cursor]
      array[zeros_cursor] = 0
      zeros_cursor += 1
    end

  end

  return array
end

def move_zeros_left(array)
  if array.size < 1
    return
  end

  write_index = array.size - 1
  read_index = array.size - 1

  while(read_index >= 0 )
    if array[read_index] != 0
      array[write_index] = array[read_index]
      write_index -= 1
    end
    read_index -= 1
  end

  while (write_index >= 0)
    array[write_index] = 0
    write_index -= 1
  end

  return array
end


array = [1, 10, 20, 0, 59, 63, 0, 88, 0]

puts "Array #{array}"
puts "Array after moving zeros left #{move_zeros_left(array)}"


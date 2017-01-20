def rotate_array(array, rotations)

  if rotations > 0
    #Rotate to the right
    rotations.downto(1) do
      array.unshift(array.pop)
    end
  else
    #Rotate to the left
    rotations *= - 1 #Make positive

    rotations.downto(1) do
      array.push(array.shift)
    end
  end

  return array
end

#Without using Ruby's swiss army push/pop methods
#Be clever and do it in place
#Speed is actually Linear, O(n)!
def rotate_in_place(array, rotations)
  #Rotate positively passed the size
  if rotations < 0
    rotations = rotations + array.size
  end

  reverse_array(array, 0, array.size - 1)
  reverse_array(array, 0, rotations - 1)
  reverse_array(array, rotations, array.size - 1)

  return array
end

def reverse_array(array, from, to)
  while(from < to)
    tmp = array[from]
    array[from] = array[to]
    array[to] = tmp

    from += 1
    to -= 1
  end
end

array = [1, 10, 20, 0, 59, 86, 32, 11, 9 ]
puts "array not rotated #{array}"
puts "Rotated Array #{rotate_array(array, -3)}"
array = [1, 10, 20, 0, 59, 86, 32, 11, 9 ]
puts "Rotated in-place Array #{rotate_in_place(array, -3)}"
#Given an array of integers and a value,
#determine if there are any three integers in the array that sum equal to the given value.
def sum_of_three_values_naive(array, value)
  return false if array.size == 0

  end_pos = array.size - 1
  for i in 0..end_pos
    for j in (i + 1)..end_pos
      for k in (j + 1)..end_pos
        if (array[i] + array[j] + array[k]) == value
          return true
        end
      end
    end
  end

  return false
end

#Given an array of integers and a value,
#determine if there are any three integers in the array that sum equal to the given value.
def sum_of_three_values(array, value)
  return false if array.size == 0

  end_pos = array.size - 1


  return false
end


array = [3,7,1,2,8,4,5]

value = 20
puts "value:#{value} #{array}"
puts "#{sum_of_three_values_naive(array,value)}"

value = 21
puts "value:#{value} #{array}"
puts "#{sum_of_three_values_naive(array,value)}"

array = [3,7,1,2,8,4,5]

value = 20
puts "value:#{value} #{array}"
puts "#{sum_of_three_values(array,value)}"

value = 21
puts "value:#{value} #{array}"
puts "#{sum_of_three_values(array,value)}"

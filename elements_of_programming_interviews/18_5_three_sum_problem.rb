#Input array, k
#output true/false
#If three elements within array equal sum return true

#Sort the array.
#Iterate through array,
  #Have inner loop that starts one right of i, and
#O(n^2)

#array [2,4,8,16,32]
#k 38

#x 2
#left 1
#right 4
#sum

#O(n^2)
def is_three_sum?(array, k)
  return false if array.length < 3

  array.sort!
  array.each_with_index do |x, i|

    left = i + 1
    right = array.length - 1

    while (left < right)
      sum = x + array[left] + array[right]

      return true if sum == k

      if sum < k
        left += 1
      else
        right -= 1
      end
    end
  end

  false
end


#Variant The three sum elements must be distinct
def is_three_sum_v1?(array, k)
  return false if array.length < 3

  array.sort!
  puts array
  array.each_with_index do |x, i|

    left = i + 1
    right = array.length - 1

    while (left < right)
      sum = x + array[left] + array[right]

      if sum < k || array[left] == x
        left += 1
      elsif sum > k || array[right] == x
        right -= 1
      elsif sum == k
        return true
      end
    end
  end

  false
end

#Variant The three sum elements must be distinct
def is_three_sum_v1?(array, k)
  return false if array.length < 3

  array.sort!
  puts array
  array.each_with_index do |x, i|

    left = i + 1
    right = array.length - 1

    while (left < right)
      sum = x + array[left] + array[right]

      if sum < k || array[left] == x
        left += 1
      elsif sum > k || array[right] == x
        right -= 1
      elsif sum == k
        return true
      end
    end
  end

  false
end



array = [2,3,3,3,3, 4, 3]
puts is_three_sum_v1?(array, 9)

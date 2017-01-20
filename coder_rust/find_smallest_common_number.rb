#Take three arrays in sorted order.
#Find the smallest common number between the three arrays.
#The brute force method seems possible be cubic, or exponential.  Definitely greater than linear.
def find_smallest_common_number_brute(array_a, array_b, array_c)
  smallest_common_number = -1

  array_a.each do |a|
    array_b.each do |b|
      array_c.each do |c|
        #Since array is ascending - we leave once we hit a match.
        return a if (a == b) && (b == c)
      end
    end
  end

  return smallest_common_number
end

#Idea Binary search
#O(N Log N)
#Go through array_a.. and then binary search each other array for the value.
#We start from beginning until we hit a match.
#..This would be  because we go through first array, and do two LogN lookups of other arrays.


#This is speed O(n), it exploits the fact that each array is in ascending order.
def find_smallest_common_number_linear(array_a, array_b, array_c)
  #Use three iterators, set all to zero
  a = b = c = 0

  #Iterator has hit the end of the road.
  until a > array_a.size - 1 || b > array_b.size - 1 || c > array_c.size - 1

    if (array_a[a] == array_b[b]) && (array_b[b] == array_c[c])
      #Found a match - since going through ascending order, this is our result.
      return array_a[a]
    end

    #Increase itierator on smallest number.
    if (array_a[a] < array_b[b]) && (array_b[b] < array_c[c])
      a += 1
    elsif (array_b[b] < array_a[a]) && (array_b[b] < array_c[c])
      b += 1
    else
      c += 1
    end
  end

  #Not Found
  return -1
end



array_a = [6, 7, 10, 25, 30, 63, 64]
array_b = [1, 4, 5, 6, 7, 8, 63]
array_c = [1, 6, 10, 14, 63]

puts "brute force #{find_smallest_common_number_brute(array_a, array_b, array_c)}"
puts "linear #{find_smallest_common_number_linear(array_a, array_b, array_c)}"

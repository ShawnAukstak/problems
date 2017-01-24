require 'pp'
#Given sorted integer array
#[2,3,5,5,7,11,11,11,13]
#modifies array: [2,3,5,7,11,13,0,0,0]
#returns number of valid entries, e.g. 6 in the above.

#O(n) O(1) solution
def delete_duplicate_entries(array)
  write_index = 0
  array.each_with_index do |v,i|
    if array[write_index] != v
      write_index += 1
      array[write_index] = v
    end
  end

  #replace shifted duplicates at the end with 0s
  (write_index..array.length - 1).each do |i|
    array[i] = 0
  end

  #return number of distinct elements
  write_index + 1
end

#Still at least O(n^2)..The problem is the shifting must be avoided
def delete_duplicate_entries_brute(array)

  #go through array, compare to next value.. 
    #if equal, do a shift.

  left, right = 0, array.length - 1

  while left < right

    if array[left] == array[left + 1]
      (left + 1...right).each do |i|
        array[i] = array[i + 1]
      end

      array[right] = 0
      right -= 1
    else
      left += 1
    end

  end

  right + 1
end


#below solution is at least O(n^2logn)?.
def delete_duplicate_entries_bsearch(array)
  left, right = 0, array.length - 1

  while left < right

    curr = array[left]
    index = bsearch(left + 1, right, curr, array)

    if index
      #remove index and shift
      (index...right).each do |i|
        array[i] = array[i + 1]
      end

      array[right] = 0

      right -= 1
    else
      #Not found, advance
      left += 1
    end

  end

  right + 1
end

def bsearch(left, right, k, array)

  while left <= right
    mid = (left + right) / 2

    if array[mid] == k
      return mid
    elsif array[mid] > k
      #left
      right = mid - 1
    else
      #right
      left = mid + 1
    end
  end

  return nil
end

array = [2,3,5,5,7,11,11,11,13]
pp delete_duplicate_entries_bsearch(array)
pp array

array = (1..20).to_a
pp delete_duplicate_entries_bsearch(array)
pp array

array = [1,2,3,4,4,6,6,13]
pp delete_duplicate_entries_bsearch(array)
pp array

array = [2,3,5,5,7,11,11,11,13]
pp delete_duplicate_entries(array)
pp array

array = (1..20).to_a
pp delete_duplicate_entries(array)
pp array

array = [1,2,3,4,4,6,6,13]
pp delete_duplicate_entries(array)
pp array

# arr = [2, 4, 5, 9, 12, 17] 
# shiftArr = [9, 12, 1, 2, 4, 6, 8]
#12


# 2 > 12 && 9 > 12
# array[mid] > value && array[left] > value

def bsearch(array, value)
   return -1 if array.length == 0
   
   bsearch_rec(array, value, 0, array.length - 1)
end

def bsearch_rec(array, value, left, right)
   return -1 if left > right
   
   mid = (left + right) / 2
   
   if array[mid] == value
      return mid
   elsif array[mid] > value && array[left] < value
      #Go left, left does not contain pivot
      return bsearch_rec(array, value, left, mid - 1)
   elsif array[mid] < value && array[right] > value
      #Go right, right does not contain pivot
      return bsearch_rec(array, value, mid + 1, right)
   elsif array[mid] > value && array[left] <= value
      #Go left, value lies on side with pivot
      return bsearch_rec(array, value, left, mid - 1)
   else
      #right
      return bsearch_rec(array, value, mid + 1, right)
   end
   
end


array = [9, 12, 17, 18, 19, 5]
puts  bsearch(array, 19)

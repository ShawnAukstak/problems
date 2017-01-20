#quick sort is NlogN

def quick_sort(array)
  array.shuffle
  sort(array, 0, array.size - 1)
  return array
end

def sort(array, low, high)
  if high > low
    pivot = partition(array, low, high) #Returns final index of the pivot point
    sort(array, low, pivot - 1) #To the left
    sort(array, pivot + 1, high) #To the Right
  end
end

#Returns the final index of the pivot point
def partition(array, low, high)
  pivot_value = array[low]
  i = low
  j = high

  #Make aure i and j did not cross.
  while(i < j)
    #Increment i until we hit pivot, or it should be on right side of pivot
    while (i <= high && array[i] <= pivot_value)
      i += 1
    end

    while (array[j] > pivot_value)
      j -= 1
    end

    #Make sure again i and j did not cross.
    if (i < j)
      #Swap i and j, since they are both the wrong sides.
      tmp = array[i]
      array[i] = array[j]
      array[j] = tmp
    else
      break #Sort will still work without this, but reduces one additional check.
    end
  end

  array[low] = array[j]
  array[j] = pivot_value

  return j
end

#Step through sorted array below, and determine why this is the worst case:
[2, 2, 3, 8, 18, 23, 23, 26, 55, 78]

array = [55,23,26,2,18,78,23,8,2,3]
puts "Array is #{array} and is sorted as #{quick_sort(array)}"
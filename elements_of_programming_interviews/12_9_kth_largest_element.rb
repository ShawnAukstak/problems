#require 'random'

#Find kth largest element
#O(n logn) - sort array, then return result.

#runtime: O(nlogk) memory O(k)
def kth_largest_element_heap(array, k)
  return if array.length > k

  heap = MinHeap.new

  array.each do |x|
    if heap.size < k
      heap.insert x
    elsif k > heap.peek
      heap.delete_min
      heap.insert k
    end
  end

  heap.peek
end

def kth_largest_element(array, k)
  return if k > array.length

  left, right = 0, array.length - 1

  while (left <= right)
    pivot = Random.rand(left..right)
    pivot = move_greater_to_left(array, pivot, left, right)

    if (pivot + 1) == k
      return array[pivot]
    elsif (pivot + 1) > k
      right = pivot - 1
    else
      left = pivot + 1
    end
  end
end

#pivots elements around pivot greater to left, and returns pivots new position
def move_greater_to_left(array, pivot, left, right)

  pivot_value = array[pivot]
  #move pivot to the end
  array[pivot], array[right] = array[right], array[pivot]
  new_pivot = left

  for i in left..right

    if array[i] > pivot_value
      array[new_pivot], array[i] = array[i], array[new_pivot]
      new_pivot += 1
    end

  end

  array[new_pivot], array[right] = array[right], array[new_pivot]
  new_pivot
end

array = [6, 4, 3, 8, 10, 2]

#3,4,6,8,10
puts kth_largest_element(array, 3)
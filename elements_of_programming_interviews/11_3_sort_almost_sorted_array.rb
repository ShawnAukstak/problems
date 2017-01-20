require 'pp'

def sort_almost_sorted(array, offset)
  heap = Array.new #To emulate a MinHeap

  for i in 0..offset
    heap << i
  end

  for i in 0..array.length - 1
    array[i] = heap.min
    heap.delete array[i] #Normally in a real heap this isn't required, because can delete min at O(1)

    if (i + offset) < array.length
      heap << array[i + offset]
    end
  end

  array
end


#Can achieve runtime:O(n) memory:O(k) where k is number of positions number could be off by


#really long sequence of almost sorted data.  No number is more than 2 away from it's final sorted position.
#design an algorithm that outputs the numbers in the correct order.
array = [3,-1, 2, 6, 4, 5, 8, 10, 9]

# 3, -1, 2, 6, 4, 5, 8
# -1, 2, 3, 4, 5, 6, 8


pp sort_almost_sorted(array, 2)
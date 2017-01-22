require_relative '../lib/heap.rb'
require 'pp'


#Runtime: O(nlogn) - iterating through entire stream, and then insert/deletes cost logn each
#Space O(n) - entire stream stored within two heaps
def median_of_stream(stream)
  max_heap, min_heap = MaxHeap.new, MinHeap.new

  while !stream.empty?
    if max_heap.size < min_heap.size
      temp = min_heap.min
      min_heap.delete_min
      max_heap.insert temp
    end

    min_heap.insert stream.shift
  end


  if min_heap.size == max_heap.size
    return (max_heap.max + min_heap.min) / 2.0
  end

  return min_heap.min
end

puts median_of_stream([1,2,3])
puts median_of_stream([10,8,6,4])
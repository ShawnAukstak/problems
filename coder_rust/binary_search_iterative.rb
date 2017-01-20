class BinarySearchIterative
  def self.find(array, value)
    low = 0
    high = array.size - 1

    while(high >= low)
      mid = low + ((high - low) / 2)

      if value == array[mid]
        #found at mid index
        return mid
      elsif value > array[mid]
        #Right Chunk
        low = mid + 1
      else
        #Left
        high = mid - 1
      end

    end

    #Not Found
    return -1
  end
end


array = [ 1, 4, 8, 12, 16, 20, 22]
binary_search = BinarySearchIterative.new
find_value = 19

puts "#{find_value} is found at #{BinarySearchIterative.find(array, find_value)}"
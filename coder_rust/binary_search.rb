class BinarySearch
  def self.find(array, value, start_index, end_index)
    puts "find #{array[start_index, end_index]} value:#{value}, start_index:#{start_index}, end_index#{end_index}"

    if start_index > end_index
      return -1
    end

    #midpoint between start_index and end_index
    midpoint_index = start_index + ((end_index - start_index) / 2)
    midpoint = array[midpoint_index]

    puts "#{midpoint_index} #{midpoint}"

    #Find the midpoint
    if value < midpoint
      #call self with left half
      puts "midpoint index #{midpoint_index - 1}"
      return self.find(array, value, start_index, midpoint_index - 1)
    elsif value > midpoint
      #call self with right half
      puts "midpoint index #{midpoint_index + 1}"
      return self.find(array, value, midpoint_index + 1, end_index)
    elsif value == midpoint
      return midpoint_index
    end

  end
end

array = [ 1, 4, 8, 12, 16, 20, 22]
binary_search = BinarySearch.new
find_value = 4

puts "#{find_value} is found at #{BinarySearch.find(array, find_value, 0, array.size - 1)}"


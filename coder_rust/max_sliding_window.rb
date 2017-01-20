#This is O(nw)
class SlidingWindow
  def initialize(array)
    @array = array
  end

  def max(w)
    result = Array.new

    start_position = 0
    end_position = start_position + w - 1

    while (end_position < @array.size)
      #create window
      window = @array[start_position, end_position]
      result << find_max(window)

      start_position += 1
      end_position += 1
    end

    return result
  end

  def find_max(window)
    max = window.first
    window.each do |x|
      max = x if x > max
    end

    return max
  end
end

class SlidingWindowLinked
  def initialize(array)
    @array = array
  end

  def max(w)
    result = Array.new
    list = Array.new

    #Setup the initial array
    for x in 0..(w-1) do
      list = insert(list, @array[x])
    end

    #Insert result of the first window
    result << list.first

    cursor = 0
    until cursor + w >= @array.length
      #remove the old value
      list = remove(list, @array[cursor])

      #add the new value
      cursor += 1
      list = insert(list, @array[cursor + (w - 1)])
      result << list.first
    end

    return result
  end

  def insert(list, element)

    #Remove elements from the tail of the array, until the element is less than or equal to the tail.
    list.reverse_each do |x|
      if element > list.last
        list.pop
      else
        break
      end
    end

    list.push(element)
    return list
  end

  def remove(list, element)
    list.each_with_index  do |x, index|
      if x == element
        list.delete_at(index)
        return list
      end
    end

    return list
  end
end


array = [ -4, 2, -5, 1, -1, 6 ]
sliding_window = SlidingWindowLinked.new(array)

puts sliding_window.max(3)


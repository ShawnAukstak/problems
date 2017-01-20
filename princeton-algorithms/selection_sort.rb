class SelectionSort
  def self.sort(array)
    last_index = array.size - 1

    for i in 0..last_index
      for j in (i+1)..last_index
        if array[j] < array[i]
          tmp = array[i]
          array[i] = array[j]
          array[j] = tmp
        end
      end

    end

    return array
  end
end


ary = [2, 1, 0, 5, 4, 9, 3]
puts SelectionSort::sort(ary)


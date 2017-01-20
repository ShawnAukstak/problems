class InsertionSort

  class << self
    def sort(array)
      last_index = array.size - 1

      for i in 0..last_index

        for j in (i-1).downto(0)
          if array[j] < array[j+1]
            break;
          else
            tmp = array[j]
            array[j] = array[j+1]
            array[j+1] = tmp
          end
        end

      end

      return array
    end
  end

end


ary = [2, 1, 0, 5, 4, 9, 3]
puts InsertionSort::sort(ary)
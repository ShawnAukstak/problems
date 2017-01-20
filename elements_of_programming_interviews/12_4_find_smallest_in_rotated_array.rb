


def find_smallest(array)
  left, right, smallest = 0, array.length - 1, 0

  while left <= right

    mid = (left + right) / 2

    if mid - 1 >= 0 && array[mid - 1] < array[mid]
      #Left
      right = mid - 1
    elsif mid + 1 <= array.length - 1  && array[mid + 1] < array[mid]
      #Right
      left = mid + 1
    else
      smallest = array[mid]
      break
    end
  end

  smallest
end



#Keep taking midpoint, and compare to neighbors.  If neighbor is small, go to that side, otherwise we have solution

array = [39,2,3,10,12,16,20,24,36]
puts find_smallest(array)
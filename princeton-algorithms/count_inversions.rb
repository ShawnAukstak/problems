class CountInversions
  def self.count(array)
    last_index = array.size - 1

    return 0 if array.size <= 1

    mid_index = (array.size / 2).round - 1
    first_half = array.slice(0, mid_index)
    second_half = array.slice(mid_index, last_index)

    

    return count
  end
end


ary = [2, 1, 0, 5, 4, 9, 3]
puts CountInversions::count(ary)

# An inversion in an array a[] is a pair of entries a[i] and a[j] such that i<j but a[i]>a[j]. 
# Given an array, design a linearithmic algorithm to count the number of inversions.
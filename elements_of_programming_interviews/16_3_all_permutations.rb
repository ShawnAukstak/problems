require 'pp'
require 'set'

def permutations_duplicates_set(array)
  results = []
  permutations_duplicates_set_rec(array,0, array.length - 1,results)
  results
end

def permutations_duplicates_set_rec(array, left_index, right_index, results)

  if left_index == right_index
    results << array.dup
    return
  end

  for i in left_index..right_index
    array[i], array[left_index] = array[left_index], array[i]
    permutations_duplicates_set_rec(array, left_index + 1, right_index, results)
    array[i], array[left_index] = array[left_index], array[i]
  end

end


def permutations(array)
  results = Array.new
  permutations_rec(array,0, array.length - 1,results)
  results
end

def permutations_rec(array, left_index, right_index, results)

  if left_index == right_index
    results << array.dup
    return
  end

  for i in left_index..right_index
    array[i], array[left_index] = array[left_index], array[i]
    permutations_rec(array, left_index + 1, right_index, results)
  end

end


array = [1,2,3]



pp permutations_duplicates_set(array)
pp permutations(array)



#input array
#output index


def bsearch_first_occurence(array, value)
  bsearch_first_occurence_rec(array, value, -1, 0, array.length - 1)
end

def bsearch_first_occurence_rec(array, value, prev, l, r)
  return prev if l > r

  mid = (l + r) / 2

  if array[mid] == value
    prev = mid
  end

  if array[mid] < value
    #Right
    return bsearch_first_occurence_rec(array, value, prev, mid + 1, r)
  else
    #Left
    return bsearch_first_occurence_rec(array, value, prev, l, mid - 1)
  end
end

#Variant 1 - returns a local minimum??
#[1, 0, 2, 3]
def local_minimum(array)
  bsearch_first_occurence_rec(array, value, 0, array.length - 1)
end



array = [-14, -10, 2, 108, 108, 243, 285, 285, 285, 401]
puts bsearch_first_occurence(array, 108)
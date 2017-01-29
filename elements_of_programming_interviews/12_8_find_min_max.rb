#Input un-ordered array:
#[3,2,5,1,2,4]
#
#Output(min and max)
#
#{min: 1, max: 5}
#Must be computed in less than 2(n - 1) comparisons


#We compare each element to it's neighbor, finding a 'min', and 'max' for that pair
#The min from each pair go into a min_candidate group, and the max go in a max_candidate group.

def min_max(array)
  return [0,0] if array.length == 0
  return [array[1],array[1]] if array.length == 1

  global_min_max = [array[0], array[1]].minmax

  i = 2
  while i < array.length - 1
    local_min_max = [array[i], array[i + 1]].minmax
    global_min_max = [[global_min_max[0], local_min_max[0]].min,
                      [global_min_max[1], local_min_max[1]].max]

    i += 2
  end

  if i == array.length - 1
    global_min_max = [[global_min_max[0], array[i]].min,
                      [global_min_max[1], array[i]].max]
  end

  global_min_max
end



puts min_max([3,2,5,1,2,4])
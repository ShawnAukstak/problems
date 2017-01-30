require 'pp'

#Generate power set of a set.
#A powerset is a set of all subsets, including empty set, and set of everything.

#Example
#Input [0,1,2]
#Output [[], [0], [1], [2], [0,1], [1,2], [0,2], [0,1,2]]

#2^n - 1

def power_sets(array)
  results = Array.new
  power_sets_rec(0, [], array, results)
  results
end

def power_sets_rec(index, current, array, results)
  if index > array.length - 1
    results << current.dup
    return
  end

  power_sets_rec(index + 1, current, array, results)
  current.push array[index]
  power_sets_rec(index + 1, current, array, results)
  current.pop
end

def power_sets_binary(array)
  results = Array.new
  set_count = 2 ** array.length

  (0..set_count - 1).each do |s|

    current = Array.new
    index = 0

    while index < array.length
      if s % 2 != 0
        current << array[index]
      end

      s /= 2
      index += 1
    end

    results << current.dup
  end

  results
end

array = [0,1,2]
pp power_sets(array)

pp power_sets_binary(array)




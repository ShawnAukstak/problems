#[3,-2,7,9,8,1,2,0,-1,5,8]
#[-2,-1,0,1,2,3]
#output is 6

#solution 1.
#O(nlogn) - sort, and then scan through and keep a counter of consecutive numbers.

#solution 2.
#O(n) O(n) - where n is number of numbers, and m is the range between min/max.
def longest_contained_range_two(array)
  return if array.length < 2

  counts = Hash.new(false)

  min, max = Float::INFINITY, -Float::INFINITY

  array.each do |n|
    min = n if n < min
    max = n if n > max

    counts[n] = true
  end

  max_interval, current_interval, seen = 0, 0, 0

  (min..max).each do |n|
    if counts[n] && counts[n - 1]
      seen +=1
      current_interval += 1
    else
      current_interval = 1
    end

    max_interval = [current_interval, max_interval].max

    break if seen >= counts.count
  end

  max_interval
end

def longest_contained_range_three(array)
  return if array.length < 2
  counts = Hash.new(false)

  #add each number to hash
  array.each do |n|
    counts[n] = true
  end

  max_interval, current_interval = 0,0

  array.each do |n|

    current_interval = 0

    if counts[n]
      current_interval += 1

      counts.delete n

      i = n - 1
      while(counts[i])
        counts.delete i
        current_interval += 1
        i -= 1
      end

      i = n + 1
      while(counts[i])
        counts.delete i
        current_interval += 1
        i += 1
      end

    end

    max_interval = [current_interval, max_interval].max
  end

  max_interval
end


puts longest_contained_range_two([3,-2,7,9,8,1,2,0,-1,5,8])
puts longest_contained_range_three([3,-2,7,9,8,1,2,0,-1,5,8])
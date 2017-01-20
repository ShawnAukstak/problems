#Given an array of N positive integers, find all the subsets of the given array that sum up to the number K.
def find_all_subsets(array, k)
  return if array.length == 0 || k == 0

  results = []
  find_all_subsets_rec(array,k,0,[],results)

  return results
end

def find_all_subsets_rec(array, k, pos, subset, results)
  puts subset
  sum = subset.inject do |sum, x|
    sum + x
  end

  if sum == k
    puts "here #{subset} #{sum}"
    results.push(subset.dup)
    subset = []
    return
  end

  for i in pos..array.size - 1
    new_sum = sum + array[i]

    if new_sum <= k
      subset << array[i]
      find_all_subsets_rec(array, k, pos + 1, subset, results)
    else
      subset = []
    end
  end
end

array = [1,3,5,21,19,7,2,5]
k = 10

puts "k=#{k} array=#{array}"
puts "find_all_subsets #{find_all_subsets(array,k)}"

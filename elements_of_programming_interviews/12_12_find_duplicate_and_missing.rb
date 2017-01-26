

#n = 3
#Array of n integers 0..(n-1), one element appears twice, therefore one is missing.
#input [2,1,0,2]
#How do you compute the one duplicate, and the one missing?



#O(nlogn) - sort and check for missing/duplicate
#This is not ideal solution, there is O(n) O(1) solution.  This involves using multiple XORs and bit manipulation.
def find_duplicate_and_missing_elements(array)
  result = Hash.new

  array.sort!

  (0..array.length - 1).each do |i|
    if i == array.length - 1
      result[:missing] = array[i - 1] + 1
    elsif array[i] == array[i + 1]
      result[:duplicate] = array[i]
    elsif array[i] == array[i + 1] - 2
      result[:missing] = array[i] + 1
    end

    break if result[:duplicate] && result[:missing]
  end

  result
end

puts find_duplicate_and_missing_elements([2,3,0,2])

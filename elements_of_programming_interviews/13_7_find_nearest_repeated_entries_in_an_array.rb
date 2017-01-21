def find_nearest_repeated_entry(array)
  hash = Hash.new

  #Add distance and index of each word to it's duplicate
  array.each_with_index do |w,i|
    if hash[w]
      diff = i - hash[w][:index]

      if diff < hash[w][:distance]
        hash[w][:distance] = diff
        hash[w][:index] = i
      end

    else
      hash[w] = { index: i, distance: Float::INFINITY}
    end
  end

  #Find the element with the minium distance
  min_index, min_distance = -1, Float::INFINITY
  hash.each_value do |h|
    if h[:distance] < min_distance
      min_index, min_distance = h[:index], h[:distance]
    end
  end

  (min_distance >= 0) ? array[min_index] : nil
end


#Runtime O(n) where n is length of array, Space Complexity O(d) where d is number of distinct words
def find_nearest_repeated_entry_improved(array)
  hash = Hash.new()
  min_index, min_distance = 0, Float::INFINITY

  array.each_with_index do |w, i|
    if hash[w]
      distance = i - hash[w]
      if (distance < min_distance)
        min_index, min_distance = i, distance
      end
    else
      hash[w] = i
    end
  end

  array[min_index]
end

array = ["All", "work", "and", "no", "play", "makes", "for", "no", "work", "no", "fun", "and", "no", "results"]

puts find_nearest_repeated_entry_improved(array)
require 'set'

#Given a dictionary of words and an input string
#whether the input string can be completely segmented into dictionary words.
def string_segmentation(dict, string)
  start_pos = 0
  end_pos = 0

  while end_pos < (string.length)
    if dict.include?(string[start_pos, end_pos - start_pos])
      start_pos = end_pos
    end

    end_pos += 1
  end

  return dict.include?(string[start_pos, end_pos - start_pos])
end

dict = Set.new ['apple', 'pear', 'pier', 'pie']
string = "applepiepear"
puts "string #{string}"
puts "Can be segmented #{string_segmentation(dict, string)}"
string = "applepeer"
puts "string #{string}"
puts "Can be segmented #{string_segmentation(dict, string)}"

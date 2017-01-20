#Assume input intervals are sorted by starting timestamp (x)
def merge_overlapping_intervals(intervals)

  return if intervals.size == 0

  merged_intervals = Array.new

  #Initial merge interval is our first interval
  merged_intervals << [intervals[0][0], intervals[0][1]]

  #Keep cursor of current merged interval
  merged_cursor = 0

  for i in intervals
    #There is a gap between our merged end and our new start
    if merged_intervals[merged_cursor][1] < i[0]
      #Create a new merge interval, there is a gap.
      merged_cursor += 1
      merged_intervals << i
    elsif i[1] > merged_intervals[merged_cursor][1]
      #New interval changes the size of our meged interval
      merged_intervals[merged_cursor][1] = i[1]
    end
  end

  return merged_intervals
end

intervals = [[1,5], [3,7], [4, 6], [6,8], [10, 12], [11, 15]]
puts "intervals #{intervals} are merged to #{merge_overlapping_intervals(intervals)}"
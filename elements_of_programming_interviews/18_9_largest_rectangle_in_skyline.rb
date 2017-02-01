#Compute the largest rectangle area in the skyline
#Note, this does not mean rectangle with most height or width.
#Input is an array of heights representing adjacent buildings, and each are considered to be equal with of one unit.

# heights = [1,2,3,3,8,5,3,6]
#max area would be (7 - 2) * 3 = 15. Taking first index of 2 to the last index of 7

#O(n^2)
def max_area_brute(heights)
  max_area = 0

  (0..heights.length - 1).each do |i|
    ((i + 1)..heights.length - 1).each do |j|
      min_height = [heights[i], heights[j]].min

      local_area = min_height * (j - i)
      max_area = [max_area, local_area].max
    end
  end

  max_area
end

#O(n)
def max_area(heights)
  stack, max_area = [], 0

  (0..heights.length).each do |i|
    while !stack.empty? && (i == heights.length || heights[i] < heights[stack.last])
      height = heights[stack.pop]
      max_area = [max_area, height * (stack.empty? ? i : i - stack.last - 1 )].max

    end

    stack.push i
  end

  max_area
end

heights = [1,2,3,3,8,5,3,6]
puts max_area_brute(heights)
puts max_area(heights)
=begin
Given a series of vertical lines all parallel to the y-aixs, find the largest amount of water trapped between them.
They are represented by an array where each index represents a point on the x-axis, and the value is the y value.

input array of points
value [start_index, end_index]

e.g.
input: [1,2,1,3,4,4,5,6,2,1,3,1,3,2,1,2,4,1]
output:[4,17]

=end

#Create a hash as we can, where key is the line height, and value is it's index
#We can use this calculate the local_area and see if it wins.
#O(n) O(n) space (every line is distinct, but no valid solution)
def largest_water_container_hash(lines)
  max_area,first_lines = 0, Hash.new

  lines.each_with_index do |y, i|
    if !first_lines[y]
      first_lines[y] = i
    else
      prev = first_lines[y]
      local_area = y * (i - prev)

      if local_area > max_area
        max_area = local_area
      end
    end

  end

  max_area
end


#Original assumption is WRONG.  Does not have to form a rectangle 
def largest_water_container(lines)
  max_area, left, right = 0, 0, lines.length - 1

  while left < right
    max_area = [max_area, [lines[left],lines[right]].min * (right - left)].max

    if lines[left] < lines[right]
      left += 1
    elsif lines[left] > lines[right]
      right -= 1
    else
      #equal
      left += 1
      right -= 1
    end

  end

  max_area
end


lines = [1,2,1,3,4,4,5,6,2,1,3,1,3,2,1,2,4,1]
puts largest_water_container_hash(lines)


lines = [1,2,1,3,4,4,5,6,2,1,3,1,3,2,1,2,4,1]
puts largest_water_container(lines)

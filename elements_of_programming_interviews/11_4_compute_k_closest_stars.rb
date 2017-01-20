#Earth is at (0,0,0)
require 'file'

class Star
  attr_reader :x, :y, :z

  def initialize(x,y,z)
    @x, @y, @z = x, y, z
  end

  def distance_from_point(point)
    x, y, z = @x - point[:x], @y - point[:y], @z - point[:z]

    x *= x
    y *= y
    z *= z

    Math.sqrt(x + y + z)
  end
end

#O(10^12) runtime, because every star.
#O(k) memory heap size

#returns k stars that are closest to earth.
def closest_stars(k)

  closest_stars = Heap.new
  earth = {x: 0, y: 0, z: 0}

  file = File.open(MILKYWAY_STARS_PATH, 'r')
  file.each_line do |l|
    coord = parse_coordinates l
    new_star = Star.new(coord[:x], coord[:y], coord[:z])

    if closest_stars.count >= k
      if new_star.distance_from_point(earth) < closest_stars.max
        closest_stars.delete_max
        closest_stars.add(new_star)
      end
    else
      closest_stars.add(new_star)
    end

  end

  file.close
  return closest_stars
#max-heap, where each star is it's distance from earth.
#Read from file, and store each star in min_heap, keep track of capacity.
#If capacity is > k, and star distance is greater than max_heap(1) do not insert, otherwise insert and max.
#closest_stars just returns the entire heap
end
=begin

#Map White spaces 0, walls are 1.
[
  [0,0]
  [0,1]
]
#Input matrix,  start coordinates, end coordinates

Test Cases
[
  [0,E]
  [S,1]
]

Test Cases
[
  [1,E]
  [S,1]
]

Test Cases
[
  [0,0, 0]
  [0,1, 0]
  [S,1, E]
]

=end
require 'pp'

class Coordinates
  attr_reader :r, :c

  def initialize(r, c)
    @r = r
    @c = c
  end

  def ==(another_coordinates)
    @r == another_coordinates.r && @c == another_coordinates.c
  end

end

#Implemented using DFS
def is_path?(maze, origin, destination)
  return false if maze.length == 0 || maze[0].length == 0

  visited = Array.new(maze.length) { Array.new(maze[0].length, false) }
  is_path_rec(maze, visited, origin, destination)
end


def is_path_rec(maze, visited, coordinates, destination)

  if !is_valid?(maze, coordinates, visited)
    return false
  end

  if coordinates == destination
    return true
  end

  visited[coordinates.r][coordinates.c] = true

  result = false

  MOVES.each do |m|
    new_coordinates = Coordinates.new(coordinates.r + m[0], coordinates.c + m[1])
    result ||= is_path_rec(maze, visited, new_coordinates, destination)
  end

  result
end

def is_valid?(maze, destination, visited)
  destination.r >= 0 && destination.r < maze.length &&
  destination.c >= 0 && destination.c < maze[0].length &&
  maze[destination.r][destination.c] == 0 &&
  !visited[destination.r][destination.c]
end

origin = Coordinates.new(1,0)
destination = Coordinates.new(0,1)
maze = Array.new(2) { Array.new(2, 0)}
maze[1][1] = 1

pp maze
puts "Is path? #{is_path?(maze, origin, destination)}"

maze[0][0] = 1
pp maze
puts "Is path? #{is_path?(maze, origin, destination)}"


# Test Cases
# [
#   [0,0, 0]
#   [0,1, 0]
#   [0,1, 0]
#   [S,1, E]
# ]

maze = Array.new(4) { Array.new(3, 0)}
maze[0][1] = 1
maze[1][1] = 1
maze[2][1] = 1
maze[3][1] = 1
origin = Coordinates.new(3,0)
destination = Coordinates.new(3,2)

pp maze
puts "Is path? #{is_path?(maze, origin, destination)}"




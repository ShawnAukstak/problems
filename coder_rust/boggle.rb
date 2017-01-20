require 'set'
# Given an NxN grid of characters and a dictionary,
# find all words which can be made from the characters in grid and present in the given dictionary.
# A word can start and end at any character in the grid.
# Next character must be adjacent to previous character in any of the directions i.e. up, down, left, right and diagonal.
# Character at each position in grid can be used only once while making a word.

class Boggle
  def initialize(character_grid, dictionary)
    @character_grid = character_grid
    @dictionary = dictionary
  end
end

class Grid
  def initialize
    @matrix = [[]]
  end

  def [](a,b)
    if @matrix[a].nil? || @matrix[a][b].nil?
      return 0
    else
      @matrix[a][b]
    end
  end

  def []=(a,b,value)
    @matrix[a] = [[]] if @matrix[a].nil?
    @matrix[a][b] == [] if @matrix[a][b].nil?
    @matrix[a][b] = value
  end

  def to_s
    s = ''
    @matrix.each do |x|
      x.each do |y|
        s << "#{y}"
      end
      s << "\n"
    end

    return s
  end
end

grid = Grid.new
grid[0,0] = 'C'
grid[0,1] = 'A'
grid[0,2] = 'T'

grid[1,0] = 'R'
grid[1,1] = 'R'
grid[1,2] = 'E'

grid[2,0] = 'T'
grid[2,1] = 'O'
grid[2,2] = 'N'
puts grid

dictionary = Set.new ['cat','cater','art','toon','moon','not','eat']
boggle = Boggle.new(grid, dictionary)



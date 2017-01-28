require 'pp'

=begin
input:
[
  [1,1,1],
  [0,0,1],
  [1,1,0],
], {row: 1, col: 2}

matrix modified in-place:
[
  [0,0,0],
  [0,0,0],
  [1,1,0],
]

=end

def paint_fill(matrix, location)
  if matrix.length == 0 || matrix[0].length == 0 ||
    location[:row] >= matrix.length || location[:row] < 0 ||
    location[:col] >= matrix[0].length || location[:col] < 0
      return
  end

  color = matrix[location[:row]][location[:col]]
  paint_fill_rec(location, color, matrix)
end

#r,c, color (color to switch to from), matrix
def paint_fill_rec(location, color, matrix)
  if matrix.length == 0 || matrix[0].length == 0 ||
    location[:row] >= matrix.length || location[:row] < 0 ||
    location[:col] >= matrix[0].length || location[:col] < 0 ||
    matrix[location[:row]][location[:col]] != color
      return
  end

  #switch color
  matrix[location[:row]][location[:col]] = (color == 1) ? 0 : 1

  [-1, 1].each do |i|
    paint_fill_rec({ row: location[:row] + i, col: location[:col]}, color, matrix)
    paint_fill_rec({ row: location[:row], col: location[:col] + i}, color, matrix)
  end
end

matrix = [
  [1,1,1],
  [0,0,1],
  [1,1,0],
]
location = { row: 1, col: 2 }


pp matrix
paint_fill(matrix, location)
pp matrix



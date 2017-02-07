=begin
Given a 2D array (matrix) named M, print all items of M in a spiral order, clockwise.
For example:

M  =  1   2   3   4   5
       6   7   8   9  10
      11  12  13  14  15
      16  17  18  19  20

The clockwise spiral print is:  1 2 3 4 5 10 15 20 19 18 17 16 11 6 7 8 9 14 13 12
=end


def print_spiral_matrix(matrix)
  return if matrix.length == 0 || matrix[0].length == 0

  top, left = 0, 0
  bottom, right = matrix.length - 1, matrix[0].length - 1

  while( top <= bottom && left <= right)

    (left..right).each do |c|
      print "#{matrix[top][c]} "
    end
    top += 1

    (top..bottom).each do |r|
      print "#{matrix[r][right]} "
    end
    right -= 1


    if (top <= bottom && left <= right)
      right.downto(left).each do |c|
        print "#{matrix[bottom][c]} "
      end
      bottom -= 1

      bottom.downto(top).each do |r|
        print "#{matrix[r][left]} "
      end
      left += 1
    end
  end
end

matrix = [
  [1, 2, 3, 4 , 5],
  [6, 7, 8, 9 , 10],
  [11, 12, 13, 14, 15],
  [16, 17, 18, 19, 20],
]

print_spiral_matrix(matrix)
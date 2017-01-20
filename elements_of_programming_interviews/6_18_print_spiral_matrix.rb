

def print_spiral_matrix(m)
  top, bottom = 0, m.length - 1
  left, right = 0, m.length - 1

  while (top <= bottom && left <= right)
    #top
    for i in left..right
      print "#{m[top][i]} "
    end
    top += 1

    #right
    for i in top..bottom
      print "#{m[i][right]} "
    end
    right -= 1

    if (top <= bottom && left <= right)
      #bottom
      for i in right.downto(left)
        print "#{m[bottom][i]} "
      end
      bottom -= 1

      #left
      for i in bottom.downto(top)
        print "#{m[i][left]} "
      end
      left += 1
    end
  end


end

matrix = [
  [1,2,3],
  [8,9,4],
  [7,6,5]
]

print_spiral_matrix(matrix)
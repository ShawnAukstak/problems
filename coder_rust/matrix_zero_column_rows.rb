require 'set'

def matrix_zero_column_rows(matrix)
  return if matrix.length == 0
  return if matrix[0].length == 0

  zero_rows = Set.new
  zero_columns = Set.new

  for i in 0..(matrix.length - 1)
    for j in (0..matrix[0].length - 1)
      if matrix[i][j] == 0
        zero_rows.add(i)
        zero_columns.add(j)
      end
    end
  end

  zero_rows.each do |row|
    for i in 0..(matrix[0].length - 1)
      matrix[row][i] = 0
    end
  end

  zero_columns.each do |c|
    for i in 0..(matrix.length -  1)
      matrix[i][c] = 0
    end
  end

  return matrix
end


matrix = [
  [5, 4, 3, 9],
  [2, 0, 7, 6],
  [1, 3, 4, 0],
  [9, 0, 3, 4]
]

puts "array #{array}"
puts "array zero #{matrix_zero_column_rows(array)}"
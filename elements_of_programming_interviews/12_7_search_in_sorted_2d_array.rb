require 'pp'

#O(n + m) O(1)
def exists_in_matrix(matrix, k)
  return false if matrix.length == 0 || matrix[0].length == 0

  r, c = 0, matrix[0].length - 1

  while(r >= 0 && c >= 0 && r < matrix.length && c < matrix[0].length)
    if matrix[r][c] == k
      return true
    elsif matrix[r][c] > k
      c -= 1
    else
      r += 1
    end
  end

  false
end

array = [
  [-1,2,4,4,6],
  [1,5,5,9,21],
  [3,6,6,9,22],
  [3,6,8,10,24],
  [6,8,9,12,25],
  [8,10,12,13,40],
]

pp array
puts "10 #{exists_in_matrix(array, 10)}"
puts "40 #{exists_in_matrix(array, 40)}"
puts "-1 #{exists_in_matrix(array, -1)}"
puts "6 #{exists_in_matrix(array, 6)}"
puts "0 #{exists_in_matrix(array, 0)}"
puts "-40 #{exists_in_matrix(array, -40)}"
puts "7 #{exists_in_matrix(array, 7)}"
puts "14 #{exists_in_matrix(array, 14)}"
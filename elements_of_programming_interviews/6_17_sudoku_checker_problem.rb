

#Solution untested - more elegent solution exists.

#Slices board into 6, 3x3 grid, and checks each.
def valid_sudoku?(board)

  numbers = Array.new(10, 0)

  #Rows
  (0..8).each do |r|
    (0..8).each do |c|
      numbers[board[r][c]] += 1

      next if (board[r][c]) == 0
      return false if numbers[board[r][c]] > (r + 1)
    end
  end

  numbers = Array.new(9, 0)

  #Columns
  (0..8).each do |c|
    (0..8).each do |r|
      numbers[board[r][c]] += 1

      next if board[r][c]== 0
      return false if numbers[board[r][c]] > (c + 1)
    end
  end

  #Grids
  (0..2).each do |r|
    (0..2).each do |c|
      row_range = (r * 3)..((r + 1) * 3) - 1
      column_range = (c * 3)..((c + 1) * 3) - 1

      return false !valid_grid( row_range, column_range, board)
    end
  end

  true
end

#true if all numbers in grid are unique
def valid_grid?(row_range, column_range, board)
  numbers = Array.new(9, 0)

  row_range.each do |r|
    column_range.each do |c|
      numbers[board[r][c]] += 1

      next if board[r][c] == 0
      return false if numbers[board[r][c]] > 1
    end
  end

  true
end




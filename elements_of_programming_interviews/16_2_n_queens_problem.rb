require 'pp'
#input: n  - size of nxn chessboard
#Output: Array of placements, each placement can be an array which represents each row and value is the column of the queen.
def n_queens_problem(n)
  results = []
  n_queens_problem_rec(0, Array.new(n, -1), results)
  results
end

def n_queens_problem_rec(row, cols, results)
  #Save valid
  if row == cols.length
    results << cols.dup
    return
  end

  #Loop through and try each placement on row
  for i in 0..cols.length - 1
    if is_valid_placement?(i, row, cols)
      cols[row] = i
      n_queens_problem_rec(row + 1, cols, results)
    end
  end
end

def is_valid_placement?(proposed_col, proposed_row, cols)

  for i in 0..proposed_row-1
    old_row = i
    old_col = cols[i]

    #Columns
    if old_col == proposed_col
       return false
    end

    diagonal_offset = proposed_row - old_row

    #Diagonals
    if old_col == proposed_col - diagonal_offset || old_col == proposed_col + diagonal_offset
      return false
    end

  end

  return true
end

n = 8
results = n_queens_problem(n)


boards = []
results.each do |x|
  board = Array.new(n) { Array.new(n, '_') }

  for i in 0..n
    board[i][x[i]] = 'Q'
  end

  boards << board
end

# pp boards
# pp results.count


def n_queens_problem_sum_variant(n)
  n_queens_problem_rec(0, Array.new(n, -1))
end

def n_queens_problem_rec(row, cols)
  #Save valid
  if row == cols.length
    # results << cols.dup
    return 1
  end

  sum = 0

  #Loop through and try each placement on row
  for i in 0..cols.length - 1
    if is_valid_placement?(i, row, cols)
      cols[row] = i
      sum += n_queens_problem_rec(row + 1, cols)
    end
  end

  return sum
end

puts n_queens_problem_sum_variant(8)


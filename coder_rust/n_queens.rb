#Given a chess board of size N x N,
#determine how many ways N queens can be placed on this board so that no two queens attack each other.

def n_queen_solutions(n)
  solutions = Array.new(n)
  n_queen_solutions_rec(n, 0, [], solutions)

  return solutions
end

def n_queen_solutions_rec(n, row,  result, solutions)
  #We went through each row and all moves were valid.
  if n == row
    solutions.push(result)
    return
  end

  for i in 0..(n-1)
    if is_valid_move?(row, i, solutions)
      solutions[row] = i
      n_queen_solutions_rec(n, row + 1, result, solutions)
    end
  end
end

#Check if move is valid based on the columns rows.
#returns true if move is valid
def is_valid_move?(proposed_row, proposed_col, solution)
  return true
end


n = 4
puts "#{n}"
puts n_queen_solutions(n)



#sudoku solver
#Input - partial solutions
#Output - complete solution

=begin

input:
sudoku_board = [
  [5,3,0,0,7,0,0,0,0],
  [6,0,0,1,9,5,0,0,0],
  [0,9,8,0,0,0,0,6,0],
  [8,0,0,0,6,0,0,0,3],
  [4,0,0,8,0,3,0,0,1],
  [7,0,0,0,2,0,0,0,6],
  [0,6,0,0,0,0,2,8,0],
  [0,0,0,4,1,9,0,0,5],
  [0,0,0,0,8,0,0,7,9],
]
output: (valid completed sudoku board)

=end

require 'set'
require 'pp'

def solve_sudoku(board)
  solve_sudoku_rec(0,0, board)
end

def solve_sudoku_rec(r,c, board)
  if c == board[0].length
    c = 0

    #board is full
    if r == board.length - 1
      return true
    end

    r += 1
  end

  #skip empty entries
  if board[r][c] != 0
    return solve_sudoku_rec(r, c + 1, board)
  end

  numbers = valid_numbers(r,c, board)

  #No valid placements
  return false if numbers.length == 0

  numbers.each do |x|

    board[r][c] = x #Assign valid number

    #Path leads to valid solution
    if solve_sudoku_rec(r, c + 1, board)
      return true
    end

    board[r][c] = 0 #Undo assignment
  end

  return false
end

#Given a location that is empty, return all valid numbers
def valid_numbers(r,c, board)
  numbers = Set.new((1..board.length).to_a)

  #Check Row
  (0..board[0].length - 1).each do |col|
    if board[r][col] != 0
      numbers.delete board[r][col]
    end
  end

  #Check Column
  if !numbers.empty?
    (0..board.length - 1).each do |row|
      if board[row][c] != 0
        numbers.delete board[row][c]
      end
    end
  end

  #Check Grid
  if !numbers.empty?
    region_size = Math.sqrt(board.length).to_i

    r_multiplier = (r / 3)
    c_multiplier = (c / 3)
    (0...region_size).each do |row|
      (0...region_size).each do |col|
        if board[row + (r_multiplier * region_size) ][col + (c_multiplier * region_size)] != 0
          numbers.delete board[row + (r_multiplier * region_size) ][col + (c_multiplier * region_size)]
        end
      end
    end

  end

  numbers.to_a
end

sudoku_board = [
  [5,3,0,0,7,0,0,0,0],
  [6,0,0,1,9,5,0,0,0],
  [0,9,8,0,0,0,0,6,0],
  [8,0,0,0,6,0,0,0,3],
  [4,0,0,8,0,3,0,0,1],
  [7,0,0,0,2,0,0,0,6],
  [0,6,0,0,0,0,2,8,0],
  [0,0,0,4,1,9,0,0,5],
  [0,0,0,0,8,0,0,7,9],
]

pp sudoku_board
puts solve_sudoku(sudoku_board)
pp sudoku_board



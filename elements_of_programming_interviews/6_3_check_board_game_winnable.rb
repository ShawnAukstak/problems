=begin
Given an array with non-negative integers, where each positions represents a maximum number of steps you can take.
You start from position 0, and need to reach index length - 1.

For example, given:
[3,3,1,0,2,0,1]

You can reach the end with the following sequence [1,3,2]

However, given the array [3,2,0,0,2,0,1], it's impossible to reach the end, or past index 3.

Determine if it's possible to reach the end given an array.

Input: array, of non-negative integers, e.g. [3,2,0,0,2,0,1]
Output: true/false

=end


#[3,3,1,0,2,0,1]

def end_reachable?(board)
  end_reachable_rec(0, board)
end

def end_reachable_rec(pos, board)
  if pos > board.length - 1
    return false
  end

  if pos == board.length - 1
    return true
  end

  board[pos].downto(1).each do |i|
    if end_reachable_rec(pos + i, board)
      return true
    end
  end

  return false
end


puts "[3,3,1,0,2,0,1] #{end_reachable?([3,3,1,0,2,0,1])}"
puts "[3,2,0,0,2,0,1] #{end_reachable?([3,2,0,0,2,0,1])}"
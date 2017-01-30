require 'pp'
=begin
empty string is matched
input integer (number of pairs of parens)
set of all acceptable pairs of parens

e.g.
2
['()()', '(())'']

#Create count of left and right.

#Base case, left and right are 0.
#If equal and left == 0, save result
#if left is greater than 0, place ( recursively
#if right is greater than left, place ) recursively
=end

#N n^n


def parens(pair_count)
  results = []
  parens_rec({left: pair_count, right: pair_count}, "", results)
  results
end

def parens_rec(parens, curr, results)
  if parens[:left] == 0 && parens[:right] == 0
    results << curr.dup
  end

  if parens[:left] > 0
    parens_rec({left: parens[:left] - 1, right: parens[:right]}, curr + '(', results)
  end

  if parens[:right] > parens[:left]
    parens_rec({left: parens[:left], right: parens[:right] - 1}, curr + ')', results)
  end
end

pp parens(1)
pp parens(2)
pp parens(3)

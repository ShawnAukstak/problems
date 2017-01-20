require 'benchmark'
require 'pp'

#Given a nxm boolean matrix, where 'true' means obstacle
#can move up/down, left/right
#how many distinct ways can you navigate from top-left, to bottom-right.

=begin
[0, 0, 0 ]
[0, 2, 1 ]
[0, 1, 1 ]
=end

#We still use DP to save paths here
def ways_traverse_brute(map)
  visited = Array.new(map.length) { Array.new(map[0].length, false) }
  saved = Array.new(map.length) { Array.new(map[0].length, 0) }

  visited[0][0] = true
  ways_traverse_brute_rec(0, 0, visited, map)
end

def ways_traverse_brute_rec(r,c,visited, map)

  #bottom right
  if r == map.length - 1 && c == map[r].length - 1
    return 1
  end

  sum = 0
  if can_visit_node?(r + 1, c, visited, map)
    visited[r + 1][c] = true
    sum += ways_traverse_brute_rec(r + 1, c, visited, map)
    visited[r + 1][c] = false
  end

  if can_visit_node?(r, c + 1, visited, map)
    visited[r][c + 1] = true
    sum += ways_traverse_brute_rec(r, c + 1, visited, map)
    visited[r][c + 1] = false
  end

  sum
end

def ways_traverse_dp(map)
  visited = Array.new(map.length) { Array.new(map[0].length, false) }
  saved = Array.new(map.length) { Array.new(map[0].length, 0) }

  visited[0][0] = true
  ways_traverse_brute_dp_rec(0, 0, visited, map, saved)
end

def ways_traverse_brute_dp_rec(r,c,visited, map, saved)

  #bottom right
  if r == map.length - 1 && c == map[r].length - 1
    return 1
  end

  if saved[r][c] > 0
    return saved[r][c]
  end

  sum = 0
  if can_visit_node?(r + 1, c, visited, map)
    visited[r + 1][c] = true
    sum += ways_traverse_brute_dp_rec(r + 1, c, visited, map,saved)
    visited[r + 1][c] = false
  end

  if can_visit_node?(r, c + 1, visited, map)
    visited[r][c + 1] = true
    sum += ways_traverse_brute_dp_rec(r, c + 1, visited, map,saved)
    visited[r][c + 1] = false
  end

  saved[r][c] = sum
  sum
end

def can_visit_node?(r,c,visited,map)
  r >= 0 && r < map.length &&
  c >= 0 && c < map[r].length &&
  visited[r][c] == false &&
  map[r][c] != true
end


def ways_traverse_dp_improved(map)
  return 0 if map.length == 0 || map[0].length == 0

  steps = Array.new(map.length) { Array.new(map[0].length, 0) }

  #Set first Row to 1
  for i in 0..map[0].length - 1
    steps[0][i] = 1
  end

  #Set second column to 1
  for i in 0..map.length - 1
    steps[i][0] = 1
  end

  #Complete last of matrix based on neighbors
  for i in 1..map.length - 1
    for j in 1..map[0].length - 1
        steps[i][j] = steps[i - 1][j] + steps[i][j - 1]
      end
  end

  steps[-1][-1]
end


# map = [
# [false, false, false],
# [false, true, false],
# [false, false, false],
# ]


# map = Array.new(5) { Array.new(5, false) }

=begin
map = Array.new(13) { Array.new(13, false) }

brute = 0
dp = 0
dp_improved = 0
Benchmark.bmbm do |x|
  x.report(:brute) { brute = ways_traverse_brute(map) }
  x.report(:dp) { dp = ways_traverse_dp(map) }
  x.report(:ways_traverse_dp_improved) { dp_improved = ways_traverse_dp_improved(map) }
end

puts "brute #{brute}"
puts "dp #{dp}"
puts "dp_improved #{dp_improved}"
=end

#k = 1
#9

#k = 2
# 9 * 10

#k = 1

#f(2, 1, 9)

#f(1,0,9)
#f(1,0,8)
#f(1,0,7)
#f(1,0,6)
#f(1,0,5)
#f(1,0,4)
#f(1,0,3)
#f(1,0,2)
#f(1,0,1)
# (10 * 9)

def monotone_sequence(k)
  results = []
  monotone_sequence_rec(k, 1, 9,[],results)
  results.size
end

def monotone_sequence_rec(k, min, max, curr, results)
  if k == 0
    results << curr.dup
    return
  end

  for i in max.downto(min)
    curr.push i
    monotone_sequence_rec(k - 1, 0, i,curr, results)
    curr.pop
  end
end

def monotone_sequence_dp(k)
  saved = Array.new(k) { Array.new(10, 0) }
  monotone_sequence_dp_rec(k, 1, 9, saved)
end

def monotone_sequence_dp_rec(k, min, max, saved)

  if k == 0
    return 1
  end

  return saved[k - 1][max] if saved[k - 1][max] > 0

  sum = 0

  for i in max.downto(min)
    sum += monotone_sequence_dp_rec(k - 1, 0, i, saved)
  end
  sum
end

# puts "monotone sequence: #{monotone_sequence(k)}"
# puts "monotone dp sequence: #{monotone_sequence_dp(k)}"

=begin
k = 20
monotone = 0
monotone_dp = 0

Benchmark.bmbm do |x|
  x.report(:monotone_brute) { monotone = monotone_sequence(k) }
  x.report(:monotone_dp) { monotone_dp = monotone_sequence_dp(k) }
  # x.report(:ways_traverse_dp_improved) { dp_improved = ways_traverse_dp_improved(map) }
end
puts "\nmonotone brute #{monotone}"
puts "monotone dp #{monotone_dp}"
# puts "monotone dp_improved #{dp_improved}"
=end

def monotone_sequence_strict(k)
  results = []
  monotone_sequence_strict_rec(k, 1, 9,[],results)
  pp results
  results.size
end

def monotone_sequence_strict_rec(k, min, max, curr, results)
  if k == 0
    results << curr.dup
    return
  end

  for i in max.downto(min)
    curr.push i
    monotone_sequence_strict_rec(k - 1, 0, i - 1, curr, results)
    curr.pop
  end
end

puts monotone_sequence_strict(3)

# puts ways_traverse(map)
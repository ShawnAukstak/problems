require 'pp'

#There exists and easier solution than the below, consisting of just a BFS.
#The trick with the BFS is it checks every node with BFS
#..if it discovers it's surrounded..
      #it stops traversal and marks every node to 'W' that is on the queue.

=begin

Input
[
  [B,B,B,B],
  [W,B,W,B],
  [B,W,W,B],
  [B,B,B,B]
]

Modified in-place:
[
  [B,B,B,B],
  [W,B,B,B],
  [B,B,B,B],
  [B,B,B,B]
]
=end



W = 1
B = 0

def compute_enclosed_regions(region)
  return if region.length < 3
  (1..region.length - 2).each do |r|
    (1..region[0].length - 2).each do |c|
      visited = Array.new(region.length) { Array.new(region[0].length, false) }

      if region[r][c] == W && !is_opening?(r,c, region, visited)
        fill_region(r,c,region)
      end
    end
  end
end

#Uses DFS to see if can reach edge
def is_opening?(r,c, region, visited)
  return false if region[r][c] == B || visited[r][c]

  if region[r][c] == W && (r == 0 || r == region.length - 1 || c == 0 || c == region[0].length - 1)
    return true
  end

  visited[r][c] = true
  is_opening = false

  [-1, 1].each do |i|
    is_opening ||= is_opening?(r + i, c, region, visited) ||  is_opening?(r, c + i, region, visited)
  end

  is_opening
end

#Uses BFS to switch white to black
def fill_region(r,c,region)
  queue = []

  if region[r][c] == W
    temp = {r: r, c: c}
  end

  while(temp)
    region[temp[:r]][temp[:c]] = B

    [-1,1].each do |i|
      if region[r + i][c] == W
        queue.unshift({ r: r + i, c: c })
      end

      if region[r][c + i] == W
        queue.unshift({ r:  r, c: c + i })
      end
    end

    temp = queue.pop
  end
end

region = [
  [B,B,B,B],
  [W,B,W,B],
  [B,W,W,B],
  [B,B,B,B]
]

pp region
compute_enclosed_regions(region)
pp region

=begin
There is a museum organized as NxN squares. Some squares are inaccessible (has a wall or some other blocking item). Guards can only move north, south, east and west. For each square, find the minimum steps needed by a guard to respond.

e.g.
+--+---+---+---+---+--+
|  | G | W | W | G |  |
+--+---+---+---+---+--+
|  |   |   |   |   |  |
+--+---+---+---+---+--+
|  |   | W | W | W |  |
+--+---+---+---+---+--+
|  | G |   |   |   |  |
+--+---+---+---+---+--+
|  | W | W |   |   |  |
+--+---+---+---+---+--+
|  | G |   |   | W |  |
+--+---+---+---+---+---

will generate the following table

+---+---+---+---+---+---+
| 1 | G | W | W | G | 1 |
+---+---+---+---+---+---+
| 2 | 1 | 2 | 2 | 1 | 2 |
+---+---+---+---+---+---+
| 2 | 1 | W | W | W | 3 |
+---+---+---+---+---+---+
| 1 | G | 1 | 2 | 3 | 4 |
+---+---+---+---+---+---+
| 2 | W | W | 3 | 4 | 5 |
+---+---+---+---+---+---+
| 1 | G | 1 | 2 | W | 6 |
+---+---+---+---+---+---+
=end

require 'pp'

G = -9
W = -5
E = Float::INFINITY

def minimum_steps(m)
    return if m.length == 0

    for r in 0..(m.length - 1)
        for c in 0..(m.length - 1)
            if m[r][c] == G
                guard_steps(m, r, c)
            end
        end
    end
end

def guard_steps(m, r, c)
    queue = Array.new
    visited = Array.new(m.length) { Array.new(m.length, false) }
    visited[r][c] = true

    #Queue up first steps in each direction
    #up/down
    for i in [-1,1]
      queue.unshift({ r: (r + i), c: c, steps: 1 })
    end

    #left/right
    for i in [-1,1]
      queue.unshift({ r: r, c: (c + i), steps: 1 })
    end

    temp = queue.pop

    while(!temp.nil?)
        r = temp[:r]
        c = temp[:c]
        steps = temp[:steps]

        #Is Valid
        if (r >= 0 && r < m.length && c >= 0 && c < m.length) && !visited[r][c] && (m[r][c] > 0)

          m[r][c] = [steps, m[r][c]].min
          visited[r][c] = true

          #up/down
          for i in [-1,1]
            queue.unshift({ r: (r + i), c: c,  steps: steps + 1})
          end

          #left/right
          for i in [-1,1]
            queue.unshift({ r: r, c: (c + i),  steps: steps + 1 })
          end
        end

        temp = queue.pop
    end
end

museum = [
[E,G,W,W,G,E],
[E,E,E,E,E,E],
[E,E,W,W,W,E],
[E,G,E,E,E,E],
[E,W,W,E,E,E],
[E,G,E,E,W,E],
]

pp museum
minimum_steps(museum)
pp museum
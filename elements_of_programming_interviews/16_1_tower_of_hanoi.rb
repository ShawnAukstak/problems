=begin
Have three pegs (stacks).
Rings are on stack 0 in size order, with largest at the bottom.
Only operation you can do it place one peg from top of on stack to another
You cannot place a larger ring ontop of a smaller ring.

input number of rings on stack[0]
output - print sequence of moves.

Create stacks + rings

If stack 1 + 3 are empty, return

See if we can move something from 1st to 2nd.
See if we can move something from 3rd to 2nd
see if we can something from from 1st to 3rd
2nd to first
2nd to 3rd
3rd to first

2nd to first
2nd to first

print move.
=end
require 'pp'


def towers_of_hanoi(number_of_rings)
  stacks = Array.new(3) { Array.new }

  number_of_rings.downto(1).each do |x|
    stacks[0].push x
  end
  pp stacks
  towers_of_hanoi_rec(number_of_rings, stacks, 0, 1, 2)
  pp stacks
end

def towers_of_hanoi_rec(rings_left, stacks, from, to, aux)

  if rings_left > 0
    #move to aux
    towers_of_hanoi_rec(rings_left - 1, stacks, from, aux, to)

    puts "move #{stacks[from].last} from #{from} to #{to}"
    stacks[to].push stacks[from].pop

    towers_of_hanoi_rec(rings_left - 1, stacks, aux, to, from)
  end

end

towers_of_hanoi(3)
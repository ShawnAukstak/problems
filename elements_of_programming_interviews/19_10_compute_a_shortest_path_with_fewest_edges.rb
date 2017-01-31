require_relative '../lib/graph.rb'
require 'pp'

def dijkstra_shortest_path(source, vertices)


#Recreated Graph seen here
#http://web.cecs.pdx.edu/~sheard/course/Cs163/Graphics/graph6.png
one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)
five = Node.new(5)

one.neighbors << { node:four, weight: 5 }
four.neighbors << { node:one, weight: 5 }

one.neighbors << { node:two, weight: 2 }
two.neighbors << { node:one, weight: 2 }

three.neighbors << { node:two, weight: 14 }
two.neighbors << { node:three, weight: 14 }

four.neighbors << { node:two, weight: 5 }
two.neighbors << { node:four, weight: 5 }

four.neighbors << { node:five, weight: 58 }
five.neighbors << { node:four, weight: 58 }

two.neighbors << { node:five, weight: 4 }
five.neighbors << { node:two, weight: 4 }

three.neighbors << { node:five, weight: 34 }
five.neighbors << { node:three, weight: 34 }

vertices = [one,two,three,four,five]
source = one


end
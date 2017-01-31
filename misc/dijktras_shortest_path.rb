require_relative '../lib/graph.rb'

#Finds shortest path in weighted graph between source, and all other nodes.

root = Node.new(0)
one = Node.new(1)
two = Node.new(2)
three = Node.new(3)
four = Node.new(4)

one.neighbors << two
two.neighbors << one
three.neighbors << two
four.neighbors << root
four.neighbors << three
four.neighbors << one

root.neighbors << two
root.neighbors << three
root.neighbors << four

cloned_root = clone_directed_graph(root)
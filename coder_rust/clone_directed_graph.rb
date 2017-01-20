require 'rgl/adjacency'
require 'set'
require_relative 'graph.rb'

#Given root node of a directed graph, clone this graph by creating its deep copy
#such that cloned graph has same vertices and edges as original graph.
def clone_directed_graph(root)
  nodes_seen = Hash.new
  return clone_rec(root, nodes_seen)
end

def clone_rec(node, nodes_seen)
  return if node.nil?

  cloned_node = Node.new(node.value)
  nodes_seen[cloned_node.value] = cloned_node

  node.neighbors.each do |n|
    if nodes_seen.has_key?(n.value)
      cloned_node.neighbors.push(clone_rec(n, nodes_seen))
    else
      cloned_node.neighbors.push(n)
    end
  end

  return cloned_node
end

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


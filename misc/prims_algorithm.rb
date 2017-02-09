=begin
Prim's Algorithm to find minimum spanning tree is a weighted undirected graph.

1. Initialize a tree with a single vertex, chosen arbitrarily from the graph.

2. Grow the tree by one edge: of the edges that connect the tree to vertices not yet in the tree,
find the minimum-weight edge, and transfer it to the tree.

Repeat step 2 (until all vertices are in the tree).

=end
require_relative '../lib/graph.rb'
require 'pp'

def minimum_spanning_tree(graph)
  return graph if !graph || graph.vertices.length == 0

  #1. Initialize a tree with a single vertex, chosen arbitrarily from the graph.
  min_tree = Graph.new
  min_tree.add_vertex(graph.vertices[0])

  #Grow the tree by one edge: of the edges that connect the tree to vertices not yet in the tree,
  #find the minimum-weight edge, and transfer it to the tree.
  loop do
    min_edge = nil

    min_tree.vertices.each do |v|

      graph.edges.each do |e|

        #If the edge destination is not in our min_tree
        if !min_tree.vertices.include? e.destination
          if !min_edge || e.weight < min_edge.weight
            min_edge = e
          end
        end

      end
    end

    break if !min_edge

    #Save min_edge/vertex
    min_tree.edges << min_edge
    min_tree.vertices << min_edge.destination
  end

  min_tree
end

#http://web.cecs.pdx.edu/~sheard/course/Cs163/Graphics/graph6.png
graph = Graph::sample

puts "Graph Edges"
graph.edges.each do |e|
  puts "#{e.source.value} connected(#{e.weight}) to #{e.destination.value}"
end

min_spanning_tree = minimum_spanning_tree(graph)

puts "Min Spanning Tree Edges:"
min_spanning_tree.edges.each do |e|
  puts "#{e.source.value} connected(#{e.weight}) to #{e.destination.value}"
end
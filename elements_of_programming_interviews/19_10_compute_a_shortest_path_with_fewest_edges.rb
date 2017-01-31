require_relative '../lib/graph.rb'
require 'pp'

=begin
Add an additional 'weight' to each edge. This is factored in when finding shortest path.
=end

#Monkey patch to just add an additional fix cost to an edge.
class Edge
  EDGE_COST = 5

  def weight
    @weight + EDGE_COST
  end
end

#return the shortest path from source to destination, with additional weight per edge
def dijkstra_shortest_path(source, destination, graph)
  distances, previouses = Hash.new(Float::INFINITY), Hash.new
  distances[source] = 0

  vertices = graph.vertices.dup

  while !vertices.empty?
    closest_vertex = vertices.min_by { |v| distances[v] }
    vertices.delete closest_vertex

    if closest_vertex == destination
      return path(previouses, destination, [])
    end

    closest_vertex.adjacent_edges.each do |e|
      neighbor = e.destination
      distance = e.weight + distances[closest_vertex]

      if distance < distances[neighbor]
        distances[neighbor] = distance
        previouses[neighbor] = closest_vertex
      end
    end
  end

  return [] #no path to destination
end

def path(previouses, destination, path)
  return if !destination

  path(previouses,previouses[destination], path)
  path << destination.value
end

#Recreated Graph seen here
#http://web.cecs.pdx.edu/~sheard/course/Cs163/Graphics/graph6.png
graph = Graph::sample
one = graph.vertices.select { |v| v.value == 1 }.first
five = graph.vertices.select { |v| v.value == 5 }.first

path = dijkstra_shortest_path(one, five, graph)
pp path


#Find the minimum spanning tree of a connected, undirected graph with weighted edges.
class Graph
  attr_accessor :nodes

  def initialize(nodes)
    @nodes = nodes || []
  end
end

class Node
  attr_accessor :edges

  def initialize(edges)
    @edges = edges || []
  end
end

class WeightedEdge
  attr_accessor :weight

  def initialize(weight)
    weight = weight
  end
end
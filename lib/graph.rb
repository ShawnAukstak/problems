class Graph
  attr_accessor :vertices, :edges

  def initialize
    @vertices, @edges = [], []
  end

  def add_vertex(vertex)
    vertex.graph = self
    @vertices << vertex
  end

  def add_edge(source, destination, weight)
    @edges << Edge.new(source, destination, weight)
  end

  #Recreated Graph seen here
  #http://web.cecs.pdx.edu/~sheard/course/Cs163/Graphics/graph6.png
  def self.sample
    graph = Graph.new

    one = Vertex.new(1)
    two = Vertex.new(2)
    three = Vertex.new(3)
    four = Vertex.new(4)
    five = Vertex.new(5)

    graph.add_vertex(one)
    graph.add_vertex(two)
    graph.add_vertex(three)
    graph.add_vertex(four)
    graph.add_vertex(five)

    graph.add_edge(one, four, 5)
    graph.add_edge(four, one, 5)

    graph.add_edge(one, two, 2)
    graph.add_edge(two, one, 2)

    graph.add_edge(two, three, 14)
    graph.add_edge(three, two, 14)

    graph.add_edge(two, four, 5)
    graph.add_edge(four, two, 5)

    graph.add_edge(four, five, 58)
    graph.add_edge(five, four, 58)

    graph.add_edge(two, five, 4)
    graph.add_edge(five, two, 4)

    graph.add_edge(three, five, 34)
    graph.add_edge(five, three, 34)

    graph
  end
end

class Vertex
  attr_accessor :value, :graph

  def initialize(value)
    @value = value
  end

  def adjacent_edges
    @graph.edges.select{ |e| e.source == self }
  end

  def to_s
    @value
  end
end

class Edge
  attr_accessor :source, :destination, :weight

  def initialize (source, destination, weight = 1)
    @source, @destination, @weight = source, destination, weight
  end
end


class Node
  attr_accessor :neighbors, :value

  def initialize(value)
    @neighbors = []
    @value = value
  end

  def to_s
    @value.to_s
  end
end

class UndirectedNode
  attr_accessor :neighbors, :value

  def initialize(value)
    @neighbors = []
    @value = value
  end

  def to_s
    @value.to_s
  end
end
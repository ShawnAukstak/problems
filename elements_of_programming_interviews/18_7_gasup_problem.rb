#20 Miles Per gallon
#Cities
#View was weighted undirected graph.

#Start from each node, doing depth first search
#Traverse through and calculate fuel,
  #if it ever runs out of fuel, return false
  #If it reaches reaches origin (point where it cannot traverse anymore, all neighbors visited.. return true)
  #else, navigate to next.

#What does weighted undirected graph look like?
  #Each Node has Adjacency list - where is weighted stored?
  #Each Node's data is gas.

class Node
  attr_reader :data, :edges

  def initialize(data, edges)
    @data = data
    @edges = edges
  end
end

class Edge
  attr_reader :weight, :destination

  def initialize(weight, destination)
    @weight = weight
    @destination = destination
  end
end


def city_with_ample_fuel?(cities)
  cities.each do |c|
    return true if ample_fuel? c
  end

  false
end

def ample_fuel?(city)
  visited = Hash.new(false)
  ample_fuel_rec(0, city,visited)
end

def ample_fuel_rec(gas, city, visited)

  city.edges do |e|
    if !visited[e.destination]
      next_edge = e
    end
  end

  #No next edge to visit, return
  return true if !next_edge

  gas += city.data * 20
  gas -= next_edge.weight

  if gas < 0
    return false
  end

  visited[edge.destination] = true
  ample_fuel_rec(gas, next_edge.destination, visited)
end



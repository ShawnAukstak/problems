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
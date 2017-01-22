
#Does not actually implement heap properly, just very quick implementation with heap methods and functionality
class Heap
  attr_reader :array

  def initialize()
    @array = []
  end

  def insert(value)
    @array.push(value)
    @array.sort!
  end

  def size
    @array.size
  end
end

class MinHeap < Heap
  def min
    @array.first
  end

  def delete_min
    @array.shift
  end
end

class MaxHeap < Heap
  def max
    @array.last
  end

  def delete_max
    @array.pop
  end
end
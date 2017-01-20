class Node
  attr_accessor :prev, :next, :value

  def initialize(value)
    @value = value
  end
end

class LRUCache
  def initialize(capacity)
    @capacity = capacity
    @items_stored = 0
    @values = Hash.new
  end

  def get(key)
    @values[key]
  end

  def set(key, value)
    unless @values.has_key?(key)
      @items_stored += 1
    end

    @values[key] = value
  end

  private

  def is_full?
    return @items_stored >= @capacity
  end
end

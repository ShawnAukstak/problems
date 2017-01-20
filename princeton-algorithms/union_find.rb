require 'pp'

class UnionFind
  def initialize(size)
    #Creates an array of size, which each value equals it's index
    @ids = Array.new(size)
    for n in 0..size-1
      @ids[n] = n
    end
    pp @ids
  end
end
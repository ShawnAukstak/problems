require_relative 'union_find'

class QuickUnion < UnionFind

  def initialize(size)
    super
  end

  def connected?(p, q)
    find_root(p) == find_root(q)
  end

  def union(p, q)
    i = find_root(p)
    j = find_root(q)

    @ids[i] = j
  end

  private

  def find_root(i)
    until i == @ids[i]
      i = @ids[i]
    end

    return i
  end
end


quick_union = QuickUnion.new(5)
quick_union.union(1,2)
puts quick_union.connected?(1,2)
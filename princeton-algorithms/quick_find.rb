require_relative 'union_find'

class QuickFindUnionFind < UnionFind

  def connected?(p, q)
    @ids[p] == @ids[q]
  end

  def union(p, q)
    pid = @ids[p]
    qid = @ids[q]

    for i in 0..@ids.size - 1
      @ids[i] = qid if @ids[i] == pid
    end
  end
end


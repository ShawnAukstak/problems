=begin

A = [
  [1, 2, 3],
  [3, 4, 5],
  [5, 6, 7]
]

S = [1,3,4,6] exist
S = [1,2,3,4] does not exist

input: A, S
output: true/false

=end

def sequence_search(matrix, seq)
  return true if seq.empty?

  #Cache is row + column + index in seqs
  cache = {}

  (0..matrix.length - 1).each do |r|
    (0..matrix[0].length - 1).each do |c|
      if matrix[r][c] == seq[0]
        return true if sequence_search_rec(matrix, r, c, seq, 0, cache)
      end
    end
  end

  return false
end

def sequence_search_rec(matrix, r, c, seq, index, cache)
  return true if index > seq.length - 1

  cache_key = {r: r, c: c, index: index}
  if cache[cache_key] != nil || !next_step?(matrix, r, c, seq[index])
    return false
  end

  [1,-1].each do |i|
    #up/down
    return true if sequence_search_rec(matrix, r + i, c, seq, index + 1, cache)

    #left/right
    return true if sequence_search_rec(matrix, r, c + i, seq, index + 1, cache)
  end

  cache[cache_key] = false
  false
end

def next_step?(matrix, r, c, value)
  r >= 0 && c >= 0 &&
  r < matrix.length && c < matrix[0].length &&
  matrix[r][c] == value
end




a = [
  [1, 2, 3],
  [3, 4, 5],
  [5, 6, 7]
]

puts sequence_search(a, [1,3,4,6])
puts sequence_search(a, [1,2,3,4])



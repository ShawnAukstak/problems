#Compute Levenshtein distance between two strings.
def levenshtein_distance(a,b)
  return levenshtein_distance_rec(a,b)
end

def levenshtein_distance_rec(a,b)
  #Base case
  return b.size if a.size == 0
  return a.size if b.size == 0

  cost = (a[a.size - 1] == b[b.size - 1]) ? 0 : 1

  d1 = levenshtein_distance_rec(a[0, a.size - 1], b) + 1 #delete
  d2 = levenshtein_distance_rec(a, b[0, b.size - 1]) + 1 #insertion
  d3 = levenshtein_distance_rec(a[0, a.size - 1], b[0, b.size - 1]) + cost #substituion

  return [d1, d2, d3].min
end


a = 'kitten'
b = 'sitting'
puts "#{a} #{b}"
puts "distance: #{levenshtein_distance(a, b)}"

a = 'min'
b = 'max'
puts "#{a} #{b}"
puts "distance: #{levenshtein_distance(a, b)}"

a = 'ant'
b = 'aunt'
puts "#{a} #{b}"
puts "distance: #{levenshtein_distance(a, b)}"
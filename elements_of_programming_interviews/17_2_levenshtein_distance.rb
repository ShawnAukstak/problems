#one edit is a insertion, deletion, and substitution of a single character
#a="cat"
#b="bat"
require 'pp'

def levenshtein_distance(a,b)
  return 0 if a == b
  return a if b.empty?
  return b if a.empty?

  #Create matrix
  solution = Array.new(a.length) { Array.new(b.length) }

  #populate first row
  for i in 0..a.length - 1
    solution[i][0] = i + 1
  end

  for i in 0..b.length - 1
    solution[0][i] = i + 1
  end


  #populate rest of matrix comparing one character at a time and previous results
  for i in 1..a.length - 1
    for j in 1..b.length - 1
      if a[i] != b[j]
        #find min of previous + 1
        min = [solution[i - 1][j - 1], solution[i - 1][j], solution[i][j - 1]].min
        solution[i][j] = min + 1
      else
        solution[i][j] = solution[i - 1][j - 1] #previous diagonal, nothing changed.
      end
    end
  end

  #Last element of the matrix contains our answer
  solution[-1][-1]
end


a = "love"
b = "hate"

puts levenshtein_distance(a,b)
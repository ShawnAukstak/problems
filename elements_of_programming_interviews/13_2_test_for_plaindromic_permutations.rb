
#given a string, determine if it's letters can be permutated to form a palindrome.
#edified for instance, is deified

# input: string
# output Boolean

#try every permutation, then check if palindrome.
#A word is a palindrome if all the letter counts for each letter are even, except for at most one.
#runtime O(n) where n is number of characters, and memory O(c) c where c is the number of distinct characters

def permutated_palindrome?(s)
  odd_count = 0
  char_counts = Hash.new(0)

  s.each_char do |c|
    if char_counts[c].even?
      odd_count += 1
    else
      odd_count -= 1
    end

    char_counts[c] += 1
  end

  odd_count < 2
end

puts permutated_palindrome?('edified')
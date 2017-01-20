require 'set'

#Naive/brute force solution is O(n^3) runtime, O(1) memory
#Given a string find all substrings that are palindromes.
def palindrome_substrings_brute_force(string)
  palindromes = Array.new

  for x in 0..(string.length - 1)
    for y in (x+1)..(string.length - 1)
      if is_palindrome?(string[x,y - x + 1])
        palindromes.push(string[x,y - x + 1])
      end
    end
  end

  return palindromes
end

#Returns true if string is a palindrome
def is_palindrome?(string)
  n = 0

  while(n < string.length / 2)
    if (string[n] != string[string.length - 1 - n])
      return false
    end

    n+=1
  end

  return true
end

#Solution is O(n^2) runtime, O(1) memory
#Uses a creative solution to do it in quadratic
#Given a string find all substrings that are palindromes.
def palindrome_substrings(string)
  palindromes = Array.new

  for i in 0..(string.length - 1)
    palindromes += find_palindrome_in_substrings(string, i - 1, i + 1) #Odd palindromes
    palindromes += find_palindrome_in_substrings(string, i, i + 1) #Even plaindromes
  end

  return palindromes
end

#Takes a string, and the current low and high indexes.
def find_palindrome_in_substrings(string, low, high)
  palindromes = Array.new

  until (low < 0 || high > string.length - 1)
    #if there is no match, end this.
    if string[low] != string[high]
      break
    end

    palindromes << string[low..high]

    low -= 1
    high += 1
  end

  #Finds all substrings in the string from low and high, expanding outwards in size
  return palindromes
end

string = "aabbbaa"
puts string
puts "palindrome substrings #{palindrome_substrings_brute_force(string)}"
palindromes = palindrome_substrings(string)
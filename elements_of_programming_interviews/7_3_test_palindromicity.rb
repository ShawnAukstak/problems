

#Runs in O(n) time, O(1) space
def is_palindrome?(string)
  return true if string.length < 2

  mid = string.length / 2

  if string.length.even?
    left,right = mid - 1, mid
  else
    left, right = mid - 1, mid + 1
  end

  while(left >= 0 && right < string.length)
    return false if string[left].downcase != string[right].downcase

    left -= 1
    right += 1
  end

  true
end

string = "eye"
puts "#{string} #{is_palindrome?(string)}"

string = "Zyyz"
puts "#{string} #{is_palindrome?(string)}"

string = "Ray a Ray"
puts "#{string} #{is_palindrome?(string)}"

string = "racecar"
puts "#{string} #{is_palindrome?(string)}"

string = "batman"
puts "#{string} #{is_palindrome?(string)}"

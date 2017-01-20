require 'set'


#Has memory complexity of O(n), and runtime of O(n)
#Can be done O(n^2) runtime, and memory of O(1) with nested loop
def remove_duplicate_characters_from_string(string)
  characters = Set.new

  i = 0
  until i > (string.length - 1)
    if characters.include?(string[i])
      string.slice!(i)
    else
      characters.add(string[i])
      i += 1
    end
  end

  return string
end

string = "dabbac"
puts "string #{string}"
puts "remove duplicates #{remove_duplicate_characters_from_string(string)}"
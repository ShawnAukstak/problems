require 'pp'

#Paths starting with '/' are absolute, otherwise relative.
#Subdirectories combined with /
#(.) current directory
#(..) parent directory

#"/thing/./../thing/some"
#"/thing/some"


#Below solution is O(n) and O(m), where n the length of the string
def find_shortest_pathname_brute(path)
  path_split, path_index, stack = path.split("/"), 0, []

  if path_split.first == ""
    is_absolute = true
    path_split.shift
  else
    is_absolute = false
  end

  path_split.each do |s|
    if s == ".." && stack.last != ".."
      stack.pop
    elsif s != "."
      stack.push s
    end

  end

  result = ""

  while !stack.empty?
    result.prepend "#{stack.pop}/"
  end

  #remove trailing slash
  if result[-1] == "/"
    result.slice!(-1,1)
  end

  #If absolute, lead with slash
  if is_absolute
    result.prepend "/"
  end

  result
end

#More memory efficient - does not use split array
def find_shortest_pathname(path)
  return if path.length == 0

  stack = []
  if path[0] == "/"
    is_absolute = true
    path.slice!(0,1)
  else
    is_absolute = false
  end

  current = ""
  path.each_char do |c|

    if c == "/"
      if current == ".." && stack.last != ".."
        stack.pop
      elsif current != "."
        stack.push current
      end

      current = ""
    else
      current << c
    end

  end

  stack.push current
  result = ""

  while !stack.empty?
    result.prepend "#{stack.pop}/"
  end

  if result[-1] == "/"
    result.slice!(-1,1)
  end

  if is_absolute
    result.prepend "/"
  end

  result
end

path = "/thing/./../thing/some"
puts path
puts find_shortest_pathname_brute(path)
puts find_shortest_pathname(path)
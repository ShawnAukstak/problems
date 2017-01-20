#Print all parentheses combinations for a given value 'n' such that they are balanced.
def print_all_parentheses(n)
  return if n <= 0

  output = []
  print_all_parentheses_rec(n,0,0,output)
end

def print_all_parentheses_rec(n, left_count, right_count, output)

  #We've printed all parentheses - give us output.
  if left_count == n && right_count == n
    puts "#{output}\n"
    return
  end

  if left_count < n
    output << "("
    print_all_parentheses_rec(n, left_count + 1, right_count, output)
    output.pop
  end

  if right_count < left_count
    output << ")"
    print_all_parentheses_rec(n, left_count, right_count + 1, output)
    output.pop
  end
end

puts "1"
print_all_parentheses(1)

puts "2"
print_all_parentheses(2)

puts "3"
print_all_parentheses(3)




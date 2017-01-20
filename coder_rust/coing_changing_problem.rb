#Given coin denominations and the total amount, find out the number​ of ways to make the change.

def coin_changing_problem(denominations, total)
  return 0 if denominations.size == 0
  return 0 if total < 0

  solutions = Array.new(total + 1, 0)
  solutions[0] = 1

  for i in 0 .. denominations.size - 1
    for j in denominations[i] .. total
      solutions[j] += solutions[j - denominations[i]]
    end
  end


  return solutions[-1]
end

d = [1, 2, 5]
amount = 7

puts "d: #{d} amount:#{amount}"
puts "Number of ways to make change #{coin_changing_problem(d,amount)}"



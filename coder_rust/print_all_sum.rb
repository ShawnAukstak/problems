def print_all_sum_rec(target, current_sum, start, output, result)
  if target == current_sum
    result << output.dup.join(' ')
  end

  for i in start..target - 1
    temp_sum = current_sum + i

    if temp_sum <= target
      output.push(i)
      print_all_sum_rec(target, temp_sum, i, output, result)
      output.pop(i)
    else
      return
    end
  end

end

def print_all_sum(n)
  result = Array.new
  output = Array.new

  print_all_sum_rec(n, 0,1, output, result)

  return result
end

n = 4
puts "Print all sum #{n}"
puts print_all_sum(n)
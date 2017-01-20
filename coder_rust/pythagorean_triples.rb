def pythagorean_triples(array)
  return array if array.length == 0
  array.sort!

  result = []

  #a^2 + b^2 - c^2 = 0
  for i in 0..array.length - 1
    first = 0
    last = array.length - 1
    c = array[i] * array[i] * -1

    until first > last
      a = array[first] * array[first]
      b = array[last] * array[last]

      sum = a + b + c
      if sum == 0
        result << "#{array[first]} #{array[last]} #{array[i]}"
        break
      end

      if sum >= 0
        last -= 1
      end

      if sum < 0
        first += 1
      end
    end
  end

  return result
end

array = [6,10,5,8,25]

puts array
puts pythagorean_triples(array)
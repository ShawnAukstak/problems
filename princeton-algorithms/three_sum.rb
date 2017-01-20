class ThreeSumBruteForce
  def initialize(numbers)
    @numbers = numbers
  end

  def count
    count = 0
    last_index = @numbers.size - 1

    for i in 0..last_index
      for j in (i+1)..last_index
        for k in (j+1)..last_index
          count = count + 1 if (@numbers[i] + @numbers[j] + @numbers[k]) == 0
        end
      end
    end

    return count
  end
end


def ThreeSumQuadraticTime
  def initialize(numbers)
    @numbers = numbers
  end

  def count
    count = 0

    #quadratic.

    return count;
  end
end

#Create two arrays of ordered negative numbers and positive numbers
#Iterate through the positive array

#Sort our array.

for i in 0..last_index
  for j in (i+1)..last_index
  end
end


40, 30, 10, 5, 0, -10, -20, -40

puts ThreeSumBruteForce.new([30, -40, -20, -10, 40, 0, 10, 5]).count


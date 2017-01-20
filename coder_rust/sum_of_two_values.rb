#Determine if the sum of any two elements in integers equals value
def sum_of_two_values(integers, value)
  integer_hash = Hash.new

  #Leverage a hash to do this in linear speed.
  integers.each do |i|
    if integer_hash.has_key? value - i
      return true
    end

    integer_hash[i] = true
  end

  return false
end

array = [5, 7, 1, 2, 8, 4, 3]

puts "#{array} and target sum of 10 is #{sum_of_two_values(array, 10)}"
puts "#{array} and target sum of 19 is #{sum_of_two_values(array, 19)}"
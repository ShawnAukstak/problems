
#Brute force - this is quadratic because it loops through both arrays
def find_max_sell_profit_force(array)
  current_buy = array[0]
  current_sell = array[1]
  profit = array[1] - array[0]

  for current_buy in 0..(array.size - 1)
    for current_sell in (current_buy + 1)..(array.size - 1)
      if (array[current_sell] - array[current_buy]) > profit
        profit = (array[current_sell] - array[current_buy])
        buy_price = array[current_buy]
        sell_price = array[current_sell]
      end
    end
  end

  return sell_price - buy_price
end


#Use Kadane's Algorithm for reference
def find_max_subarray(array)
  max_so_far = max_ending_here = -1.0 / 0
  array.each do |i|
    max_ending_here = [i, max_ending_here + i].max
    max_so_far = [max_so_far, max_ending_here].max
  end

  return max_so_far
end

#Trick is to use additional variables to track profit and buy price as you iterate through.
def find_max_sell_profit(array)
  current_buy_price = array[0]
  global_sell = array[1]
  global_profit = global_sell - current_buy_price

  current_profit = -1.0 / 0

  array.each do |i|
    current_profit = i - current_buy_price

    if current_profit > global_profit
      global_profit = current_profit
      global_sell = i
    end

    if i < current_buy_price
      current_buy_price = i
    end

  end

  #global_sell - global_profit is way to calculate the global buy.
  return [global_sell - global_profit, global_sell]
end

#Kadane's algorithm is used to get max sum within a subarray of the array

#Returns an array of buy_price, sell_price
array = [8, 5, 12, 19, 1]
puts "#{array} max sell profit is brute force #{find_max_sell_profit_force(array)}"

array = [21, 12, 11, 9, 6, 3]
puts "#{array} max sell profit is brute force #{find_max_sell_profit_force(array)}"

array = [21, 12, 11, -10, 6, 3]
puts "#{array} max subarray is #{find_max_subarray(array)}"

#Returns an array of buy_price, sell_price
array = [8, 5, 12, 19, 1]
puts "#{array} max sell profit is #{find_max_sell_profit(array)}"

array = [21, 12, 11, 9, 6, 3]
puts "#{array} max sell profit is #{find_max_sell_profit(array)}"

array = [12, 5, 9, 19]
puts "#{array} max sell profit is #{find_max_sell_profit(array)}"


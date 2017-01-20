require 'rspec/autorun'

#O(n)
#buy_price, sell_price
#current_profit, max_profit

#buy_price 260
#current_buy_price 230
#max_profit 20
#profit 25


def buy_and_sell_price(prices)
  return if prices.length < 2

  buy_price = prices[0]
  current_buy_price = buy_price
  max_profit = (prices[1] - buy_price)

  for i in 2..prices.length - 1
    profit  = prices[i] - current_buy_price

    if profit > max_profit
      buy_price = current_buy_price
      max_profit = profit
    else
      current_buy_price = [current_buy_price, prices[i]].min
    end
  end

  [buy_price, max_profit + buy_price]
end

#Variant
#Given an array of integers, return the length of the longest subarray where all the elements are equal
def longest_equal_subarray(array)
  return 0 if array == 0

  current_length, max_length, number = 0, 0, array.first

  array[1..-1].each do |x|
    if x == number
      current_length += 1
    else
      number = x
      current_length = 0
    end

    max_length = [max_length, current_length].max
  end

  max_length
end

RSpec.describe "longest_equal_subarray" do
  it "return longest subarray of equal elements" do
    array = [2, 3, 4, 5, 6, 6, 6, 6, 2, 2, 3, 2, 99]

    expect(longest_equal_subarray(array)).to eq 3
  end
end

RSpec.describe "buy_and_sell_price" do
  it "returns buy and sell price for max profit" do
    prices = [310, 315, 275, 295, 260, 270, 290, 230, 255, 250]

    expect(buy_and_sell_price(prices)).to eq [260, 290]
  end
end
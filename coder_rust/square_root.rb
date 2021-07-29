# require 'rspec/autorun'

require 'prime'
def square_root(x)
    low, hight = 0, x
    while low <= hight
        mid = low + (hight - low) / 2
        return mid if mid * mid == x
        hight = mid - 1 if mid * mid > x
        low = mid + 1 if mid * mid < x
    end
    low - 1
end

n = 16
puts "Square root of #{n} is #{square_root(n)}"
n = 25
puts "Square root of #{n} is #{square_root(n)}"
n = 100
puts "Square root of #{n} is #{square_root(n)}"


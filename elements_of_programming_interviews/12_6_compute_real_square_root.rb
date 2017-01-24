#Input, float
#Output, square root.

#O(log x/s) where s is the tolerance
def calculate_square_root(n)

  if n > 1.0
    left, right = 0, n
  else
    left, right = n, 1.0
  end

  mid = n / 2.0

  while (mid * mid) < n - Float::EPSILON || (mid * mid) > n + Float::EPSILON

    if (mid * mid) > n
      #left
      right = mid
    else
      #right
      left = mid
    end

      mid = (left + right) / 2.0
  end

  mid
end


puts calculate_square_root(16)
puts calculate_square_root(0.5) #.707
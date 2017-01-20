#takes integer, returns the largest integer who's square that is less than or equal to int


#keep dividing by 2 until our square is less than or equal to k,
#then go up one number at a time until square is greater than k.
#result is last square less than or equal to k

#O(n)
def square_root(k)
  root = k / 2
  square = root * root

  while square >= k
    root /= 2
    square = root * root
  end

  while square < k
    temp_root = root + 1

    if (temp_root * temp_root) > k
      break
    end

    root = temp_root
  end

  root
end


puts square_root(327)
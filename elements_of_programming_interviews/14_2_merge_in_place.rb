
def merge_inplace(a, b)

  a_right, b_right = (a.length - b.length - 1), b.length - 1
  i = a.length - 1

  while (a_right >= 0 && b_right >= 0)

    if (a[a_right] > b[b_right])
      a[i] = a[a_right]
      a_right -= 1
    else
      a[i] = b[b_right]
      b_right -= 1
    end

    i -= 1
  end

  while a_right >= 0
    a[i] = a[a_right]
    a_right -= 1
    i -= 1
  end

  while b_right >= 0
    a[i] = b[b_right]
    b_right -= 1
    i -= 1
  end

  a
end

#a = [1,2,3]
a = Array.new(7)
for i in 0..2
  a[i] = i
end

b = [6,8,10,12]

puts merge_inplace(a,b)


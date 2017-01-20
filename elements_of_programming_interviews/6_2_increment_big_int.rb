require 'pp'

#input [1,2,9]
#output [1,3,0]
def increment_big_int(array)
  carry = 1

  for i in (array.length - 1).downto(0)
    break if carry == 0

    array[i] += carry

    if array[i] == 10
      array[i] = 0
    else
      carry = 0
    end
  end

  if carry > 0
    array.unshift 1
  end

end

a = [9, 9, 9]
increment_big_int(a)
pp a
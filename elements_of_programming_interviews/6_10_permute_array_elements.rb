require 'pp'

#['a','b','c'] [1,0,2]
#array

#['a','b','c'], [1,0,2]
#['a','a','c'],
#temp = b

#temp = 'a', p_index

#Use only constant additional storage, set in place in array.
def permute(array,p)
  return if array.length != p.length

  (0..p.length - 1).each do |i|

    if p[i] >= 0

      j = i
      temp = array[i]

      loop do
        next_j = p[j]
        next_temp = array[next_j]
        array[next_j] = temp

        p[j] -= array.length #need to account for zero

        j, temp = next_j, next_temp

        break if j == i
      end

    end

  end

  array
end

#['a','b','c','d'], [2,0,1,3]
#['b','c','a','d']
array = ['a','b','c','d']
p = [2,0,1,3]
permute(array, p)
pp array
require 'pp'

=begin
n-bit Gray code is a permutation of 0, 1, 2, .. 2^(n - 1)
Each successive interger only differs in one place.
With wrap around (first and last only differ in on place)

input (n integer)
output (n-bit gray code)

e.g.
input: 3
output: [0,1,3,2,6,7,5,4] or [0,4,5,7,6,2,3,1]

input: 2
[00,10,11,01]
=end


def gray_code(n)
  results = Array.new(2 ** n)
  results[0] = 0
  gray_code_rec(n, 0, results)
  results
end

def gray_code_rec(n, index, results)

  #if at end of sequence, return true
  if index == results.length - 1
    return true
  end

  if !repeated_code?(index, results)
    return false
  end

  prev = results[index]
  index += 1

  (0..n - 1).each do |i|
    new_code = inverts_bit(i, prev)
    results[index] = new_code

    if gray_code_rec(n, index, results)
      return true
    end
  end

  false
end

#iterates through new_codes, makes sure code at index, is not repeat elsewhere.
def repeated_code?(index, codes)
  curr = codes[index]

  (0..index - 1).each do |i|
    if codes[i] == curr
      return false
    end
  end

  true
end

#switches bit from 1
def inverts_bit(pos, n)
  n ^ (1 << pos)
end

pp "2 #{gray_code(2)}"
pp "3 #{gray_code(3)}"
pp "4 #{gray_code(4)}"

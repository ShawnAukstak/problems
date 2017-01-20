#Base is base 2 or less
#Target base is base 16 or less.
def convert_base(base, integer, target_base)
  x = 0
  result = ''

  start_pos = (integer[0] == '-') ? 1 : 0

  for i in start_pos..(integer.length - 1)
    x *= base
    x += (integer[i].ord - '0'.ord < 10) ? integer[i].ord - '0'.ord : integer[i].ord - 'A'.ord + 10
  end
  x


  while (x > 0)
    remainder = x % target_base
    result.prepend (remainder < 10) ? remainder.to_s : ((remainder - 10) + 'A'.ord).chr
    x /= target_base
  end


  if start_pos == 1
    result.prepend '-'
  end

  result
end

#(2**5) +

#10000

puts convert_base(10, "255", 16) #should equal 16


def convert_to_binary(integer)
  result = ""

  negative = (integer < 0 ) ? true : false;

  while(integer > 0)
    x = integer % 2
    result.prepend x.to_s
    integer /= 2
  end

  result.prepend '-' if negative
  result
end

def convert_to_dec(binary)
  result = 0

  start = binary[0] == '-' ? 1 : 0

  for i in start..binary.length - 1
    result *= 2
    result += (binary[i] == '1') ? 1 : 0
  end

  if start == 1
    result *= -1
  end

  result
end

10000

(1 * 2) * 2 * 2 * 2


binary = "101"
dec = convert_to_dec(binary)
puts dec
puts convert_to_binary(dec)
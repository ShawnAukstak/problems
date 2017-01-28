#11, 232, 1 => true
#-1, 231, 12 => false

def is_number_palindrome?(n)
  return false if n < 0

  num_digits = (Math.log10(n).floor + 1)
  most = 10 ** (num_digits - 1)

  while (most > 0)
    return false if (n / most) != (n % 10)

    n %= most
    most /= 100
    n /= 10
  end

  true
end

x = 11
puts "#{x} #{is_number_palindrome?(x)}"

x = 232
puts "#{x} #{is_number_palindrome?(x)}"

x = 2332
puts "#{x} #{is_number_palindrome?(x)}"

x = 2323
puts "#{x} #{is_number_palindrome?(x)}"

x = 12
puts "#{x} #{is_number_palindrome?(x)}"

x = -1
puts "#{x} #{is_number_palindrome?(x)}"

x = 1004006004001
puts "#{x} #{is_number_palindrome?(x)}"
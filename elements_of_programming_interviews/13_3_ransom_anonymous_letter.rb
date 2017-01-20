
#letter = "cat"
#mag = "batman can see"

{
  'a' => 3,
  'b' => 1,
  't' => 1,
  'c' => 1
}

def can_write_letter?(letter, mag)
  return false if letter.length > mag.length

  hash = Hash.new(0)

  mag.each_char do |c|
    hash[c.downcase] += 1
  end

  letter.each_char do |c|
    return false if hash[c.downcase] == 0

    hash[c.downcase] -= 1
  end

  return true
end


puts can_write_letter?('cat', 'batman can see')
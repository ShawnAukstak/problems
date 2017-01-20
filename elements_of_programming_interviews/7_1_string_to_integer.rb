#input string (representing an integer - can be negative)
#output int

#Determine if number is negative, or not.  If so make note and remove negative sign.
#Starting from left to right, convert each char to integer.  Multiply number by 10 to shift left
#multiply by -1 if negative


DIGIT_MAPPINGS = {
  '0' => 0,
  '1' => 1,
  '2' => 2,
  '3' => 3,
  '4' => 4,
  '5' => 5,
  '6' => 6,
  '7' => 7,
  '8' => 8,
  '9' => 9,
}

def string_to_i(string)
  return if string.empty?

  pos,int = 0, 0
  is_negative = false

  if (string[0] == '-')
    is_negative = true
    pos += 1
  end

  #Insert first digit
  digit = DIGIT_MAPPINGS[string[pos]]
  return if !digit
  int = digit
  pos += 1

  for i in pos..string.length - 1
    digit = DIGIT_MAPPINGS[string[i]]

    return if !digit

    #Insert digit
    int *= 10
    int += digit
  end

  int *= -1 if is_negative
  int
end

puts string_to_i("-1")
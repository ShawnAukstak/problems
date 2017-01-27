#symbols descending order, with following exceptions
#I can immediately precede V and X
#X can immediately precede L and C
#C can immedaitely precede D and M
#back to back exceptions are not allowed, e.g. IXC is invalid, as is CDM
#For exceptions, add the difference of the larger symbol and the smaller symbol.

#59 could be LVIIII and LIX

DECIMAL_VALUES = {
  "I" => 1,
  "V" => 5,
  "X" => 10,
  "L" => 50,
  "C" => 100,
  "D" => 500,
  "M" => 1000,
}

#Might Easier to compute right to left
#O(n) O(1)
#Also could have assumed only exceptions would be the allowed ones.  Much simplier logic.
def roman_to_int(roman)
  decimal, i = 0,0

  while i < roman.length

    if i > 0
      if roman[i - 1] == 'I' && (roman[i] == 'V' || roman[i] == 'X')
        decimal -= (2 * DECIMAL_VALUES[roman[i - 1]])
      elsif roman[i - 1] == 'X' && (roman[i] == 'L' || roman[i] == 'C')
        decimal -= (2 * DECIMAL_VALUES[roman[i - 1]])
      elsif roman[i - 1] == 'C' && (roman[i] == 'D' || roman[i] == 'M')
        decimal -= (2 * DECIMAL_VALUES[roman[i - 1]])
      end
    end

    decimal += DECIMAL_VALUES[roman[i]]

    i += 1
  end

  decimal
end

#second
puts roman_to_int("LIX")
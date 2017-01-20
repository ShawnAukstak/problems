

MAPPINGS = [
  '', '', 'ABC', 'DEF'
]

def char_combos(digits)
  results = []
  char_combos_rec('', digits, 0, results)
  results
end

def char_combos_rec(curr, digits, i, results)
  if i >=  digits.length
    results << curr
    return
  end

  letters = MAPPINGS[digits[i].to_i]
  letters.each_char do |letter|
    char_combos_rec(curr + letter, digits, i + 1, results)
  end
end


puts char_combos('23')
#Given a text and a pattern, determine if the pattern matches with text completely or not using regular expression matching.
#For simplicity assume that the pattern may contain only two operators i.e. '.' and '*'. Operator '*' in pattern means
#that the character preceding '*' may not appear or may appear any number of times in text.
#Operator '.' matches with any character in text exactly once.
def regular_expression_match(text, pattern)

  return false
end

text = "aabbbbbcdda"

pattern = "a*bb*cdda"
puts "#{text} #{pattern} match #{regular_expression_match(text,pattern)}"

pattern = "a*bb*.dda"
puts "#{text} #{pattern} match #{regular_expression_match(text,pattern)}"

pattern = "aab*e*cd*a"
puts "#{text} #{pattern} match #{regular_expression_match(text,pattern)}"

pattern = "a*b*c*d*a*"
puts "#{text} #{pattern} match #{regular_expression_match(text,pattern)}"

pattern = ".*b*c*d*a*"
puts "#{text} #{pattern} match #{regular_expression_match(text,pattern)}"

pattern = "aabbbbbcdda"
puts "#{text} #{pattern} match #{regular_expression_match(text,pattern)}"

pattern = "aabbbbbcdd"
puts "#{text} #{pattern} match #{regular_expression_match(text,pattern)}"

pattern = "a*b*c*da"
puts "#{text} #{pattern} match #{regular_expression_match(text,pattern)}"

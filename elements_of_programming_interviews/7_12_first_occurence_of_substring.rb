
#"swim", "the fish swims well.  the fish loves to swim"
#should return 9

#scan text for first character of 'string', if found.. compare to rest of string
#O(n^2) where n is the length of the text.

def find_substring_brute(string, text)

  text.chars.each_with_index do |c, i|

    if c == string[0]

      match_count = 1
      (1..string.length - 1).each do |j|
        break if text[i + j] != string[j]
        match_count += 1
      end

      if match_count == string.length
        return i
      end
    end

  end

  return -1
end

puts find_substring_brute("swim", "the fish swims well.  the fish loves to swim")
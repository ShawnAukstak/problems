require 'pp'


#input "bcdacebe"
#output "(a,1),(b,2),(c,2),(d,1),(e,2)"
#Runtime O(n + dlogd) Space O(d) where n is array length and d is # distinct characters
def character_frequencies(string)
  char_counts = Hash.new(0)

  #count each char in lowercase
  string.each_char do |c|
    char_counts[c.downcase] += 1
  end

  pp char_counts
  #Sort the chars by letters alphabetically
  sorted_chars = char_counts.sort_by { |k, v| }

  pp sorted_chars
  #Setup output
  sorted_chars.map { |c| "(#{c[0]},#{c[1]})" }.join(',')
end


string = "bcdacebe"
pp character_frequencies(string)

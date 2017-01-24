#test if brackets, parathesis, are well formed, e.g. (, {, [
#well formed: (,),(,),[,]
#not well formed: [(])

#runtime O(n) space: O(n)?
def well_formed?(string)
  stack = []

  string.each_char do |c|
    if c =~ /[\(\{\[]/
      stack.push closing_paren c
    elsif c =~ /[\)\}\]]/
      if c != stack.pop
        return false
      end
    end
  end

  stack.empty?
end

def closing_paren(c)
      case c
      when '('
          return ')'
      when '{'
          return '}'
      when '['
          return ']'
      end
end


string = "(,),(,),[,]"
puts string
puts well_formed?(string)

string = "[(])"
puts well_formed?(string)
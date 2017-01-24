#1, 11, 21, 1211, 111221, 312211
#Each integer is described by previous in the sequence.
#Return nth in the sequence
#Runtime expontential, difficult to calculate is O(n2^n)
def look_and_say(n)
  prev = "1"
  curr = ""

  while(n > 1)
    i = 0

    while(i < prev.length)

      char = prev[i]
      count = count_digits(i, prev)
      i += count

      curr << count.to_s << char
    end

    prev = curr.dup
    curr = ""
    n -= 1
  end

  prev
end

def count_digits(i, string)
  char, count = string[i], 0

  while (i < string.length && string[i] == char)
    count += 1
    i += 1
  end

  count
end

puts look_and_say(5)
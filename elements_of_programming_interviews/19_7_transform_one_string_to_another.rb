require 'set'

#dictionary = { "bats", "meow", "jate", "jats", "dogs", "jade"}
#s = "jade"
#t = "bats"

#return length of shortest production sequence, sequence changing one character a time.
def transform_string(s, t, dict)
  queue = Array.new
  length = 0

  #push s ontop queue, remove from dictionary to mark as "visited"
  queue.push({ string: s, length: 0 })
  dict.delete s

  temp = queue.pop

  while temp

    if temp[:string] == t
      return temp[:length]
    end

    dict.each do |w|
      if neighbors?(temp[:string],w)
        queue.push({ string: w, length: temp[:length] + 1 })
        dict.delete w
      end
    end

    temp = queue.pop
  end

  -1
end

def neighbors?(s, t)
  return false if s.length != t.length

  count = 0
  for i in 0..s.length - 1
    if s[i] != t[i]
      count +=1
    end

    return false if count > 1
  end

  true
end

#dictionary = { "bats", "meow", "jate", "jats", "dogs", "jade"}
#s = "jade"
#t = "bats"

dictionary = Set.new(["bats", "meow", "jate", "jats", "dogs", "jade"])
s = "jade"
t = "bats"
puts transform_string(s, t, dictionary)


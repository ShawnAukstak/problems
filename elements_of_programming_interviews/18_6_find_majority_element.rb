
#Given a stream of words, more than half the words are a majority word.
#The majority words could be anywhere in the scan
#Scan the stream once, using only constant memory to determine what the majority word
#O(n) O(1)

def majority_element(stream)
  candidate, count = "", 0

  stream.each(" ") do |w|
    if count == 0
      candidate = w
      count = 1
    elsif candidate == w
      count += 1
    else
      count -= 1
    end
  end

  candidate
end

string = "meow meow woof meow bang woof meow woof meow"

stream = StringIO.new(string)
puts majority_element(stream)

dcfarrar@live.co.uk
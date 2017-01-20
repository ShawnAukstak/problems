#Simple solution but has memory complexity of O(sentence.size)
#Effectively makes hash of every word, and then combines them into new sentence
#sentence.split(' ').reverse.join(' ')
#Must be done in-place

#Assume single space, and do not worry about, capitalization, etc.
#e.g. "The quick brown fox jumped over the lazy dog." -> "dog. lazy the over jumped fox brown quick The"

def reverse_string(string, low, high)
  #Reverse the string
  while(low < high)
    temp = string[low]
    string[low] = string[high]
    string[high] = temp

    low += 1
    high -= 1
  end

  return string
end

def reverse_words_in_sentence(sentence)
  if !sentence || sentence.size <= 2
    return sentence
  end

  sentence = reverse_string(sentence,0, sentence.length - 1)

  low = 0
  high = 0

  while(true)

    while (sentence[low] == ' ')
      low += 1
    end

    if low >= sentence.length
      break
    end

    high = low + 1
    while (sentence[high] != ' ' && high < sentence.length)
      high += 1
    end

    sentence = reverse_string(sentence, low, high - 1)

    low = high
  end

  return sentence
end

sentence = "Hello World"

puts sentence
puts reverse_words_in_sentence(sentence)

sentence = "The quick brown fox jumped over the lazy dog."

puts sentence
puts reverse_words_in_sentence(sentence)
=begin
Implement a document scanning engine that receives a text document doc and
returns a list of all unique words in it and their number of occurrences, sorted by the number of occurrences in descending order.

Example:
for doc: "practice makes perfect. get perfect by practice. just practice!"
the engine returns the list: { practice: 3, perfect: 2,  makes: 1, get: 1, by: 1, just: 1 }.

The engine should ignore punctuation and white-spaces.
Find the minimal runtime complexity and analyze it.
=end
require 'pp'

def word_count(doc)
  word_counts = Hash.new(0)
  current_word = ""

  doc.each_char do |c|
    if c == " "
      word_counts[current_word] += 1
      current_word = ""
    elsif c =~ /[A-Za-z]/
      current_word << c.downcase
    end
  end

  #Last word
  word_counts[current_word] += 1

  result = []
  word_counts.each do |k,v|
    result << [k,v]
  end

  result.sort_by! do |wc|
    wc[1]
  end

  result.reverse!
end

pp word_count("practice makes perfect. get perfect by practice. just practice!")
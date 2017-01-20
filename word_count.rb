require 'rspec/autorun'


# doc = "practice makes perfect. get perfect by practice. just practice!"
# words = doc.scan(/\w+/)

#doc: "practice makes perfect. get perfect by practice. just practice!"
#list: { practice: 3, perfect: 2,  makes: 1, get: 1, by: 1, just: 1 }.

#in-efficient because creates in memory copy of doc in array
def word_count(doc)
  #downcase and remove non characters
  clean_doc = doc.gsub(/[^a-zA-Z\s]/,'').downcase
  words = clean_doc.split(' ')
  
  result = Hash.new
  
  words.each do |w|
    key = w.to_sym
    if result.has_key?(key)
      result[key] += 1
    else
      result[key] = 1
    end
  end
  
  return result.values.sort.reverse
end

RSpec.describe "word_count" do
  it "returns list of words by count in descending order" do
    
    doc = "practice makes perfect. get perfect by practice. just practice!"
    
    result = { makes: 1, practice: 3, perfect: 2, get: 1, by: 1, just: 1 } 
    puts result
    puts word_count(doc)
    expect(word_count(doc)).to eq result
  end
end

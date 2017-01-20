require 'rspec/autorun'

def is_rotation?(s1, s2)
  if s1.length != s2.length
    return false
  end

  s1 << s1
  s1.include?(s2)
end

RSpec.describe "is_rotation?" do
  it "returns true if second string is a rotation of first string" do
    expect(is_rotation?("waterbottle", "erbottlewat")).to eq true
    expect(is_rotation?("waterbottle", "erbttlewatj")).to eq false
  end
end

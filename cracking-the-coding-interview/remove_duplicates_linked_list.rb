require 'rspec/autorun'
require 'set'

class Node
  attr_accessor :next, :data
  
  def initialize(data)
    @data = data 
  end
  
  def to_s
    output = data.to_s
    
    node = @next 
    until node.nil?
      output << " #{node.data}"
      
      node = node.next
    end
    
    return output
  end
end

def remove_duplicates(head)
  seen = Set.new
  node = head
  prev = nil
 
  until node.nil?
    if seen.include?(node.data)
      prev.next = node.next
    else
      seen.add(node.data)
      prev = node
    end
    
    node = node.next
  end
  
  return head
end

RSpec.describe Node do
  describe "#to_s" do
    it "returns a string with a data values" do
      head = Node.new(1)
      second = Node.new(2)
      third = Node.new(3)
      head.next = second
      second.next = third
      
      expect(head.to_s).to eq "1 2 3"
    end
  end
end

RSpec.describe "remove_duplicates" do
  it "remove duplicate nodes" do
    head = Node.new(1)
    second = Node.new(3)
    third = Node.new(2)
    fourth = Node.new(3)
    fifth = Node.new(3)
    
    head.next = second
    second.next = third
    third.next = fourth
    fourth.next = fifth
  
    remove_duplicates(head)
    
    expect(head.to_s).to eq "1 3 2"
  end
end
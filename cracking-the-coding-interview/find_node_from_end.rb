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

def find_node_from_end(head, k)
  
  node = head

  i = 0 
  while(i < k)
    return if node.nil?
    
    i+= 1 
    node = node.next
  end

  until node.nil?
    node = node.next

    if node != nil
      head = head.next
    end
  end
  
  return head 
end

RSpec.describe "find_node" do
  it "returns node at position" do
    #Linked-list 1,2,3,4,5,
    head = Node.new(1)
    second = Node.new(2)
    third = Node.new(3)
    fourth = Node.new(4)
    fifth = Node.new(5)
    
    head.next = second
    second.next = third
    third.next = fourth
    fourth.next = fifth
    
    
    expect(find_node_from_end(head, 10)).to eq nil
    expect(find_node_from_end(head, 2).data).to eq 3 
  end
end

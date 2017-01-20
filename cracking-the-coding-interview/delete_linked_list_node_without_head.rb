require 'rspec/autorun'

class Node
  attr_accessor :next, :value
  
  def initialize(value)
    @value = value
  end
  
  def to_s
    output = String.new
    output << @value.to_s
    
    node = @next
    
    until node.nil?
      output << " #{node.value.to_s}"
      node = node.next
    end
    
    return output
  end
end


def delete_node(node)
  return if node.nil?

  if node.next != nil
    next_node = node.next
    node.value = next_node.value
    node.next = next_node.next
  else
    #Replace last value with dummy value
    node.value = 0
  end
end

RSpec.describe 'delete_node' do
  it 'deletes node from linked list' do
    
    #Given - Linked list 1 2 3 4
    head = Node.new(1)
    second = Node.new(2)
    third = Node.new(3) 
    fourth = Node.new(4)
    head.next = second
    second.next = third
    third.next = fourth
    
    #When - Delete node '3'
    delete_node(third)
    
    expect(head.to_s).to eq "1 2 4"
  end
end
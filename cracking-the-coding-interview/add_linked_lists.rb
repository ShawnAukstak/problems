require 'rspec/autorun'

class Node
  attr_accessor :next, :value
 
  def initialize(value)
    @value = value
  end
end

def sum_linked_lists(head_a, head_b)
  
  num_a = 0
  until head_a.nil?
    num_a = (num_a * 10) + head_a.value 

    head_a = head_a.next
  end

  num_b = 0
  until head_b.nil?
    num_b = (num_b * 10) + head_b.value 
    
    head_b = head_b.next
  end
  
  return num_a + num_b
end

RSpec.describe "sum_linked_lists" do
  it "returns sum of the linked lists" do
    
    #1 -> 0 -> 3
    head_a = Node.new(1)
    second_a = Node.new(0)
    third_a = Node.new(3)
    
    head_a.next = second_a
    second_a.next = third_a
    
    #4 -> 0 -> 9
    head_b = Node.new(4)
    second_b = Node.new(0)
    third_b = Node.new(9)
    
    head_b.next = second_b
    second_b.next = third_b
    
    #103 + 409 = 512
    expect(sum_linked_lists(head_a, head_b)).to eq 512
  end
end
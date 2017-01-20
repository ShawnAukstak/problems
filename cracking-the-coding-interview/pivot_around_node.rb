#NOTE - We did the wrong problem!!
#The problem is to put to the left and right of a value!
#It does not have to exist within the linked list!!

require 'rspec/autorun'

class Node
  attr_accessor :next, :value
  
  def initialize(value)
    @value = value
  end
end

def pivot_around_node(head, value)
  return if head.nil?
  
  left_head = nil 
  left_tail = nil
  pivot = nil
  right_head = nil
  right_tail = nil
  
  until head.nil?
    
    if head.value < value
      #left side
      if left_head.nil?
        #Add first thing to the left..
        left_head = head 
        left_tail = head 
      else
        #Append to end of left tail..
        left_tail.next = head
        left_tail = head
      end
    elsif head.value > value
      
      if right_head.nil?
        right_head = head
        right_tail = head
      else
        right_tail.next = head
        right_tail = head
      end
      
      #right side
    else
      #equal to..
      if pivot.nil?
        pivot = head
      else
        #add to right side
        if right_head.nil?
          right_head = node
          right_tail = node
        else
          right_tail.next = head
          right_tail = head
        end
      end
    end
    
    head = head.next
  end
  
  #Pivot not found
  return if pivot.nil?
  
  #attach pivot to right_head
  pivot.next = right_head
    
  if left_tail != nil
    #Things are to left of pivot..
    left_tail.next = pivot
    return left_tail
  else 
    #Nothing to the left of pivot, pivot is head.
    return pivot
  end
end

RSpec.describe "pivot_around_node" do
  it "Moves all nodes less than value to left and greater to right" do
    #4->1->3->2->5
    head = Node.new(4)
    second = Node.new(1)
    third = Node.new(3)
    fourth = Node.new(2)
    fifth = Node.new(5)

    head.next = second
    second.next = third
    third.next = fourth
    fourth.next = fifth
    
    head = pivot_around_node(head,3)
    node = head
    
    until node.value == 3
      expect(node.value).to be < 3
      node = node.next
    end
    
    expect(node.value).to eq 3
    node = node.next
    
    until node.nil?
      expect(node.value).to be > 3
      node = node.next
    end
  end
end
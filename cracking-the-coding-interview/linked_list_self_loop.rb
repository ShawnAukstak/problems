require 'rspec/autorun'
require 'set'

class Node
  attr_accessor :next, :value
  
  def initialize(value)
    @value = value
  end
end


def find_loop_head_storage(head)
  seen = Set.new
  
  until head.nil?
    if seen.include?(head)
      return head
    end
    
    seen.add(head)
    
    head = head.next
  end
  
  return nil 
end

def find_loop_head(head)
  
  return if head.nil?
  
  slow = head
  fast = head
  
  until slow.nil? || fast.nil?

    #One step a time
    slow = slow.next
    
    #Fast takes 2 steps at a time
    if fast.next.nil?
      return nil
    end
    fast = fast.next.next
    
    if slow == fast
      break
    end
  end
  
  #Self-loop not found
  if slow.nil? || fast.nil?
    return nil
  end

  slow = head
  
  until slow == fast
    slow = slow.next
    fast = fast.next
  end
  
  return slow
end

RSpec.describe "find_loop_head" do
  it "returns head of cycle in linked list" do
    
    #Given 1 2 3 4 5 6 4..
    head = Node.new(1)
    second = Node.new(2)
    third = Node.new(3)
    fourth = Node.new(4)
    fifth = Node.new(5)
    sixth = Node.new(6)
    
    head.next = second
    second.next = third
    third.next = fourth
    fourth.next = fifth
    fifth.next = sixth
    
    #Self Loop
    sixth.next = fourth
    
    expect(find_loop_head(head).value).to eq 4
  end
end
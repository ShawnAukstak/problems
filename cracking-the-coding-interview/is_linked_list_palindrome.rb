require 'rspec/autorun'
require 'pry'

class Node
  attr_accessor :next, :value
  
  def initialize(value)
    @value = value
  end
end

def is_palindrome_aux?(head)
  array = []
  
  until head.nil?
    array << head.value
    head = head.next
  end
  
  mid = (array.length / 2.to_f).ceil - 1

  for i in 0..mid
    if array[mid - i] != array[mid + i]
      return false
    end
  end
  
  return true 
end

def is_palindrome?(head)
  slow = head
  fast = head
  
  until fast.nil?
    break if fast.next.nil?
   
    slow = slow.next
    fast = fast.next.next
  end
  
  right_head = nil

  #Use slow to create the right half in reverse
  until slow.nil?
    temp = slow
    slow = slow.next

    temp.next = right_head
    right_head = temp
  end
  
  #Iterate through out reversed right half, until false
  until right_head.nil?
    if head.value != right_head.value
      return false
    end
    
    head = head.next
    right_head = right_head.next
  end
  
  return true 
end

RSpec.describe "is_palindrome?" do
  it "returns true if palindrome" do
    
    #cat
    cat_head = Node.new('c')
    cat_second = Node.new('a')
    cat_third = Node.new('t')
    cat_head.next = cat_second
    cat_second.next = cat_third
    
    #kayak
    kayak_head = Node.new('k')
    kayak_second = Node.new('a')
    kayak_third = Node.new('y')
    kayak_fourth = Node.new('a')
    kayak_fifth = Node.new('k')
    kayak_head.next = kayak_second
    kayak_second.next = kayak_third
    kayak_third.next = kayak_fourth
    kayak_fourth.next = kayak_fifth
    
    #is cat a palindrome?
    expect(is_palindrome?(cat_head)).to eq false
    
    #is kayak a palindrome?
    expect(is_palindrome?(kayak_head)).to eq true 
  end
end
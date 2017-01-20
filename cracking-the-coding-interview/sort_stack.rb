require 'rspec/autorun'

class Stack < Array
  def initialize
    @stack = []
  end
  
  def pop
    @stack.pop
  end

  def push(value)
    @stack.push(value)
  end

  def peek
    @stack.first
  end
  
  def empty?
    @stack.empty?
  end
  
end

#May only use one additional stack in sort.
def sort_stack(a)
  if a.empty?
    return
  end
  
  b = Stack.new
  
  until a.empty?
    
    temp = a.pop
    popped = 0
    
    until b.empty? || temp >= b.peek
      a.push(b.pop)
      popped +=1
    end
    
    b.push(temp)

    popped.times do
      a.push(a.pop)
    end
  end
  
  return b
end

RSpec.describe "sort_stack" do
  it "sorts stack in ascending order" do 
    # 6 4 2 8
    stack = Stack.new
    stack.push(8)
    stack.push(2)
    stack.push(4)
    stack.push(6)
    
    stack = sort_stack(stack)
   
    expect(stack.pop).to eq 8
    expect(stack.pop).to eq 6
    expect(stack.pop).to eq 4
    expect(stack.pop).to eq 2
    expect(stack.empty?).to eq true
  end
end

require 'rspec/autorun'

class SetOfStacks
  
  def initialize(stack_capacity)
    if stack_capacity < 1
      throw "stack capacity must be greater than zero"   
    end
    
    @capacity = 0
    @stack_capacity = stack_capacity
    @stacks = []
  end

  def push(value)
    
    if @stacks[current_stack].nil?
      @stacks[current_stack] = []
      @stacks[current_stack].push(value)
    else
      @stacks[current_stack].push(value)
    end

    @capacity += 1
  end
  
  def pop
    @capacity -= 1
    @stacks[current_stack].pop
  end
  
  def popAt(index)
    @stacks[index].pop
  end
  
  private 
  
  def current_stack
    @capacity / @stack_capacity 
  end
end

RSpec.describe SetOfStacks do
  describe "#push" do
    it "adds element to set of stacks" do
      # 5 4 3 2 1
      stacks = SetOfStacks.new(4)
      stacks.push(1)
      stacks.push(2)
      stacks.push(3)
      stacks.push(4)
      stacks.push(5)
      
      expect(stacks.pop).to eq 5
      expect(stacks.pop).to eq 4
      expect(stacks.pop).to eq 3
      expect(stacks.pop).to eq 2
      expect(stacks.pop).to eq 1
    end
  end

  describe "#popAt" do
    it "pops an element from substack" do
      # 5, 4 3, 2 1
      stacks = SetOfStacks.new(2)
      stacks.push(1)
      stacks.push(2)
      stacks.push(3)
      stacks.push(4)
      stacks.push(5)
      
      expect(stacks.popAt(1)).to eq 4
    end
  end
end
class StackOfStrings
  def initialize()
    @stack = Array.new
  end

  def push(item)
    @stack.push(item)
  end


  def empty?
    #emagagpty
    @stack.empty?
  end

  def pop
    @stack.pop
  end

  def max
    stack_copy = @stack.dup

    until self.empty?

      value = self.pop
      max = value if max.nil? || value > max
    end

    @stack = stack_copy

    return max
  end
end



stack = StackOfStrings.new

stack.push(1)
stack.push(2)
stack.push(3)
stack.push(100)
stack.push(50)
stack.push(101)

puts stack.max

#If argument is - than we pop and output, else we push onto stack
#to be or not to - be - - that - - - is


#Implement a queue using two stacks, how would this work?
6
54321

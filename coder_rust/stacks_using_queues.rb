#Implement a stack using queues
class StackSlowPop

  def initialize
    @queue_a = Array.new
    @queue_b = Array.new
  end

  def push(value)
    @queue_a.unshift(value)
  end

  #This is O(N), because it needs to always go to the bottom of the stack
  #Note, push/pop can we swapped to make push O(N) and pop O(1)
  def pop
    if @queue_a.length == 0
      throw 'Empty Stack'
    end

    until @queue_a.length == 1
      @queue_b.unshift(@queue_a.pop)
    end

    result = @queue_a.pop

    tmp = @queue_a
    @queue_a = @queue_b
    @queue_b = tmp

    return result
  end
end


stack = Stack.new
stack.push(1)
stack.push(2)
stack.push(3)
stack.push(4)

puts stack.pop
puts stack.pop
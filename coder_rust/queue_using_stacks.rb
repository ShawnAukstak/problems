class Queue
  def initialize
    @stack_a = Array.new
    @stack_b = Array.new
  end

  def is_empty?
    return @stack_a.length == 0 && @stack_b.length == 0
  end

  def enqueue(value)
    @stack_a.push(value)
  end

  def dequeue
    if is_empty?
      throw 'Queue is empty'
    end

    if @stack_b.length == 0
      until @stack_a.length == 0
        @stack_b.push(@stack_a.pop)
      end
    end

    return @stack_b.pop
  end
end

queue = Queue.new
queue.enqueue(1)
queue.enqueue(2)
queue.enqueue(3)
queue.enqueue(4)

puts queue.dequeue
puts queue.dequeue
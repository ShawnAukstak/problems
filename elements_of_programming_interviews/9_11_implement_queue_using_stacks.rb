require 'rspec/autorun'
require 'pp'

#O(m) where m is the number of operations.
#This is because an element is pushed no more than twice, and popped no more than twice.

class QueueUsingStacks
  def initialize()
    @enqueue_stack, @dequeue_stack = [], []
  end

  def enqueue(value)
    @enqueue_stack.push value
  end

  def dequeue
    if @dequeue_stack.empty?
      while !@enqueue_stack.empty?
        @dequeue_stack.push @enqueue_stack.pop
      end
    end

    @dequeue_stack.pop
  end
end


#1,2,3,4
#stack 4,3,2,1
#stack_b 1,2,3,4

RSpec.describe QueueUsingStacks do
  it "adds elements in LIFO" do
    queue = QueueUsingStacks.new

    queue.enqueue 1
    queue.enqueue 2
    queue.enqueue 3
    queue.enqueue 4

    expect(queue.dequeue).to eq 1
    expect(queue.dequeue).to eq 2
    queue.enqueue 5
    expect(queue.dequeue).to eq 3
  end
end



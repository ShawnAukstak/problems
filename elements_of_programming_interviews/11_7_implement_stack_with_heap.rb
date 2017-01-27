require 'rspec/autorun'
require_relative '../lib/heap.rb'
require 'pp'

#Implement Stack Using Heap
class HeapStack
  def initialize()
    @max_heap = MaxHeap.new
  end

  def peek
    return if !(max = @max_heap.max)

    max.value
  end

  def pop
    return if !(max = @max_heap.max)

    @max_heap.delete_max
    max.value
  end

  def push(value)
    next_index = (@max_heap.max) ? @max_heap.max.index + 1 : 0
    @max_heap.insert(HeapItem.new(value, next_index))
  end

  class HeapItem
    attr_reader :value, :index

    def initialize(value, index)
      @value = value
      @index = index
    end

    def <=>(b)
      @index <=> b.index
    end
  end
end

RSpec.describe HeapStack do
  it "implements stack api" do
    stack = HeapStack.new
    stack.push 1
    stack.push 2
    stack.push 3

    expect(stack.peek).to eq 3
    expect(stack.pop).to eq 3
    expect(stack.peek).to eq 2
    expect(stack.pop).to eq 2
    expect(stack.pop).to eq 1
    expect(stack.pop).to eq nil
  end
end